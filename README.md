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

## Example session
**Start cluster**
```
ra_kv_store:start_cluster().
```
**Test cycle**
```
ra_kv_store:until_block().
ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
```

**Example output**
```
(ra2@ratatosk.local)1> ===> Booted ra_test                                                                                                                                                                                                                                                                                                                                                                                                                                                   [40/50]
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
(ra2@ratatosk.local)1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
(ra2@ratatosk.local)1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
(ra2@ratatosk.local)1> ra_kv_store:start_cluster().                                                                                                                                                                                                                                                                                                                                                                                                                                                 
Attempting to communicate with node ra1@ratatosk.local, response: pong                                                                                                                                                                                                                                                                                                                                                                                                                              
Attempting to communicate with node ra2@ratatosk.local, response: pong                                                                                                                                                                                                                                                                                                                                                                                                                              
Attempting to communicate with node ra3@ratatosk.local, response: pong                                                                                                                                                                                                                                                                                                                                                                                                                              
{ok,[{ra_kv,'ra2@ratatosk.local'},                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
     {ra_kv,'ra3@ratatosk.local'},                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
     {ra_kv,'ra1@ratatosk.local'}],                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    []}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
(ra2@ratatosk.local)2> ra_kv_store:until_block().                                                                                                                                                                                                                                                                                                                                                                                                                                                   
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra2@ratatosk.local'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra2@ratatosk.local'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra3@ratatosk.local'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
** exception error: no match of right hand side value {error,                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                       {no_more_servers_to_try,                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                        [{timeout,{ra_kv,'ra3@ratatosk.local'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {timeout,{ra_kv,'ra3@ratatosk.local'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {error,noproc}]}}                                                                                                                                                                                                                                                                                                                                                                                                                                
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)                                                                                                                                                                                                                                                                                                                                                                                                   
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)                                                                                                                                                                                                                                                                                                                                                                                                        
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)                                                                                                                                                                                                                                                                                                                                                                                                        
(ra2@ratatosk.local)3> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).                                                                                                                                                                                                                                                                                                                                                                                                         
{ok,undefined,{ra_kv,'ra3@ratatosk.local'}}                                                                                                                                                                                                                                                                                                                                                                                                                                                         
(ra2@ratatosk.local)4> ra_kv_store:until_block().                                                                                                                                                                                                                                                                                                                                                                                                                                                   
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra3@ratatosk.local'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
Restarting server  {ra_kv,'ra2@ratatosk.local'}                                                                                                                                                                                                                                                                                                                                                                                                                                                     
Going for a round...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
** exception error: no match of right hand side value {error,                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                       {no_more_servers_to_try,                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                        [{timeout,{ra_kv,'ra2@ratatosk.local'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {timeout,{ra_kv,'ra2@ratatosk.local'}},                                                                                                                                                                                                                                                                                                                                                                                                    
                                                         {error,noproc}]}}                                                                                                                                                                                                                                                                                                                                                                                                                                
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)                   
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)                        
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)                        
(ra2@ratatosk.local)5> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).                         
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},                                             
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},                                             
                                {error,noproc}]}}  
(ra2@ratatosk.local)6> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)7> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{ok,undefined,{ra_kv,'ra2@ratatosk.local'}}
(ra2@ratatosk.local)8> ra_kv_store:until_block().                                          
Going for a round...
Restarting server  {ra_kv,'ra2@ratatosk.local'}
Going for a round...
** exception error: no match of right hand side value 
                    {error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                                    {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                                    {error,noproc}]}}
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)
(ra2@ratatosk.local)9> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)10> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)11> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)12> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{ok,undefined,{ra_kv,'ra2@ratatosk.local'}}
(ra2@ratatosk.local)13> ra_kv_store:until_block().                                          
Going for a round...
Restarting server  {ra_kv,'ra2@ratatosk.local'}
Going for a round...
** exception error: no match of right hand side value 
                    {error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                                    {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                                    {error,noproc}]}}
     in function  ra_kv_store:consistent_query/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 51)
     in call from ra_kv_store:maybe_block/0 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 40)
     in call from ra_kv_store:until_block/1 (/home/orre/work/ra_test/src/ra_kv_store.erl, line 57)
(ra2@ratatosk.local)14> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)15> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)16> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)17> ra:consistent_query(ra_kv_store:servers(), fun(_) -> undefined end).
{error,{no_more_servers_to_try,[{timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {timeout,{ra_kv,'ra2@ratatosk.local'}},
                                {error,noproc}]}}
(ra2@ratatosk.local)18> ra:leader_query(ra_kv_store:servers(), fun(_) -> undefined end).    
{ok,{{9,8},undefined},{ra_kv,'ra2@ratatosk.local'}}                                
```
