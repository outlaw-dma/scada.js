/* Usage:
---------------
    radio-buttons(value="{{transfer.state}}" true-color="orange")
        .ui.buttons
            radio-button(value="accepted") Kabul
            radio-button(value="pending" default) Beklemede
*/

Ractive.components['radio-buttons'] = Ractive.extend do
    template: RACTIVE_PREPARSE('index.pug')
    on:
        "*.init": (ctx, instance) ->
            true-color = @get \true-color
            false-color = @get \false-color
            @push \buttons, instance

            set-selected-color = (new-val) ~>
                buttons = @get \buttons
                for btn in buttons
                    btn-val = if btn.get \value => that else btn.partials.content.to-string!
                    if btn-val is new-val
                        btn.set \colorclass, true-color
                    else if not new-val? and btn.get \default
                        # set the default value if specified
                        @set \value, btn-val
                        btn.set \colorclass, true-color
                    else
                        btn.set \colorclass, false-color

            instance.on \click, (ctx2) ->
                new-val = if ctx2.get \value => that else @partials.content.to-string!
                @set \value, new-val
                set-selected-color new-val

            set-selected-color @get \value

    data: ->
        buttons: []
        'true-color': 'green'



Ractive.components['radio-button'] = Ractive.extend do
    template: RACTIVE_PREPARSE('radio-button.pug')
