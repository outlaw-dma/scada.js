require! components
{sleep} = require "aea"

# Ractive definition
ractive = new Ractive do
    el: '#main-output'
    template: '#main-template'
    data:
        button-state: null
        toggle-my-component: true
        my-unix-time: 1454277600000


ractive.on \complete, ->
    i = 0
    states =
        \waiting
        \normal
        \error
        \okey

    unixs = [1454277600000,1454276600000,1454257600000,1454247600000]

    <- :lo(op) ->
        new-state = states[i++]
        new-unix = unixs[i++]
        #console.log "changing state: ", new-state
        ractive.set \buttonState, new-state
        ractive.set \myUnixTime, new-unix
        if i > 3
            i:=0
        <- sleep 5000ms
        lo(op)
