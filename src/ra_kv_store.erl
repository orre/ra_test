-module(ra_kv_store).
-behaviour(ra_machine).
-export([init/1, apply/3, servers/0, start_cluster/0, maybe_block/0, until_block/0, consistent_query/0, purge_ra_state_dirs/0]).

-define(vcall(E), (io:format(user, "~w: ~s => ~p~n", [?LINE, ??E, E]))).

-opaque state() :: #{term() => term()}.
-type ra_kv_command() :: {write, Key :: term(), Value :: term()} | {read, Key :: term()}.

init(_Config) -> #{}.

apply(_Meta, {write, Key, Value}, State) ->
  {maps:put(Key, Value, State), ok, []};
apply(_Meta, {read, Key}, State) ->
  Reply = maps:get(Key, State, undefined),
  {State, Reply, []}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

purge_ra_state_dirs() ->
  [{_, S1}, {_, S2}, {_, S3}] = servers(),
  file:del_dir_r(S1),
  file:del_dir_r(S2),
  file:del_dir_r(S3).

servers() ->
  [{ra_kv, 'ra1@ratatosk.local'}, {ra_kv, 'ra2@ratatosk.local'}, {ra_kv, 'ra3@ratatosk.local'}].

start_cluster() ->
  purge_ra_state_dirs(),
  Servers = servers(),
  [io:format("Attempting to communicate with node ~s, response: ~s~n", [N, net_adm:ping(N)]) || {_, N} <- Servers],
  [rpc:call(N, ra, start, []) || {_, N} <- Servers],
  ClusterName = cluster,
  Config = #{},
  Machine = {module, ?MODULE, Config},
  ra:start_cluster(default, ClusterName, Machine, servers()).

maybe_block() ->
  io:format("Going for a round...~n"),
  [Server1, _, _] = Servers = servers(),
  timer:sleep(5000),
  ok = ra:stop_server(Server1), %Stop one server
  timer:sleep(5000),
  Leader = consistent_query(),
  io:format("Restarting server  ~p~n", [Leader]),
  ok = ra:stop_server(Leader), %Stop the leader. Now we have no majority.
  timer:sleep(1000),
  ok = ra:restart_server(Leader), %Restart the stopped leader. After an election we should have majority again
  timer:sleep(1000),
  consistent_query(),
  ok = ra:restart_server(Server1), %Restart first server we stopped
  ok.

consistent_query() ->
  {ok, undefined, Leader} = ra:consistent_query(servers(), fun(_) -> undefined end),
  Leader.

until_block() ->
  until_block(0).
until_block(N) ->
  maybe_block(),
  until_block(N + 1).
