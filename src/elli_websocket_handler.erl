%% @author Maas-Maarten Zeeman <mmzeeman@xs4all.nl>
%% @copyright 2013 Maas-Maarten Zeeman
%%
%% @doc Elli WebSocket Handler Behaviour
%%
%% Copyright 2013 Maas-Maarten Zeeman
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(elli_websocket_handler).

-include_lib("elli_websocket.hrl").

-callback websocket_init(Req :: elli:req(), Args :: any()) ->
    {ok, Headers :: elli:headers(), State :: any()} |
    {ok, Headers :: elli:headers(), hibernate, State :: any()} |
    {ok, Headers :: elli:headers(), Timeout :: non_neg_integer(), State :: any()} | 
    {ok, Headers :: elli:headers(), hibernate, Timeout :: non_neg_integer(), State :: any()} | 
    {shutdown, Headers :: elli:headers()}.


-callback websocket_handle(_Req :: elli:req(), _Message :: elli_websocket:message(), _State :: any()) ->
    %% {reply, ReplyMessage :: elli_websocket:message(), State}.
    ok.

-callback websocket_info(_Req :: elli:req(), _Message :: any(), _State :: any()) ->
    {ok, ReplyState :: any()}.

-callback websocket_handle_event(_Event :: elli_websocket:event(), _Args :: list(), _State :: any()) -> 
    ok.
