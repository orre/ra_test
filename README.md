ra_test
=====

An OTP application

# Build

    $ rebar3 compile

# Test

## Start 3 erlang nodes
```
rebar3 shell --name ra1@ratatosk.local
```
```
rebar3 shell --name ra2@ratatosk.local
```
```
rebar3 shell --name ra3@ratatosk.local
```

## Run test

```
% Start cluster and run test cycle
ra_kv_store:start_cluster().
ra_kv_store:until_block().
ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
```

## Example session
```
(ra2@ratatosk.localdomain)1> ===> Booted ra_test                                                                                                                                                                                                                                                                                                                                                                                                                                                   [40/50]
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
(ra2@ratatosk.localdomain)1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
(ra2@ratatosk.localdomain)1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
(ra2@ratatosk.localdomain)1> ra_kv_store:start_cluster().                                                                                                                                                                                                                                                                                                                                                                                                                                                 
Attempting to communicate with node ra1@ratatosk.localdomain, response: pong                                                                                                                                                                                                                                                                                                                                                                                                                              
Attempting to communicate with node ra2@ratatosk.localdomain, response: pong                                                                                                                                                                                                                                                                                                                                                                                                                              
Attempting to communicate with node ra3@ratatosk.localdomain, response: pong                                                                                                                                                                                                                                                                                                                                                                                                                              
{ok,[{ra_kv,'ra2@ratatosk.localdomain'},                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
     {ra_kv,'ra3@ratatosk.localdomain'},                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
     {ra_kv,'ra1@ratatosk.localdomain'}],                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    []}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
(ra2@ratatosk.localdomain)2> ra_kv_store:until_block().                                                                                                                                                                                                                                                                                                                                                                                                                                                   
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra2@ratatosk.localdomain'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra2@ratatosk.localdomain'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra3@ratatosk.localdomain'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
** exception error: no match of right hand side value {error,                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                       {no_more_servers_to_try,                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                        [{timeout,{ra_kv,'ra3@ratatosk.localdomain'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {timeout,{ra_kv,'ra3@ratatosk.localdomain'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {error,noproc}]}}                                                                                                                                                                                                                                                                                                                                                                                                                                
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)                                                                                                                                                                                                                                                                                                                                                                                                   
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)                                                                                                                                                                                                                                                                                                                                                                                                        
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)                                                                                                                                                                                                                                                                                                                                                                                                        
(ra2@ratatosk.localdomain)3> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).                                                                                                                                                                                                                                                                                                                                                                                                         
{ok,undefined,{ra_kv,'ra3@ratatosk.localdomain'}}                                                                                                                                                                                                                                                                                                                                                                                                                                                         
(ra2@ratatosk.localdomain)4> ra_kv_store:until_block().                                                                                                                                                                                                                                                                                                                                                                                                                                                   
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra3@ratatosk.localdomain'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra2@ratatosk.localdomain'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
** exception error: no match of right hand side value {error,                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                       {no_more_servers_to_try,                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                        [{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {error,noproc}]}}                                                                                                                                                                                                                                                                                                                                                                                                                                
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)                   
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)                        
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)                        
(ra2@ratatosk.localdomain)5> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).                         
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},                                             
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},                                             
                                {error,noproc}]}}  
(ra2@ratatosk.localdomain)6> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)7> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{ok,undefined,{ra_kv,'ra2@ratatosk.localdomain'}}
(ra2@ratatosk.localdomain)8> ra_kv_store:until_block().                                          
Going for a round...
Restarting server  {ra_kv,'ra2@ratatosk.localdomain'}
Going for a round...
** exception error: no match of right hand side value 
                    {error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                                    {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                                    {error,noproc}]}}
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)
(ra2@ratatosk.localdomain)9> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)10> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)11> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)12> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{ok,undefined,{ra_kv,'ra2@ratatosk.localdomain'}}
(ra2@ratatosk.localdomain)13> ra_kv_store:until_block().                                          
Going for a round...
Restarting server  {ra_kv,'ra2@ratatosk.localdomain'}
Going for a round...
** exception error: no match of right hand side value 
                    {error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                                    {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                                    {error,noproc}]}}
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)
(ra2@ratatosk.localdomain)14> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)15> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)16> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)17> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {timeout,{ra_kv,'ra2@ratatosk.localdomain'}},
                                {error,noproc}]}}
(ra2@ratatosk.localdomain)18> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end, infinity).
```
