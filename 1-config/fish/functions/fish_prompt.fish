function fish_prompt
    # Cache exit status
    set -l last_status $status

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (uname -n|cut -d . -f 1)
    end
    if not set -q __fish_prompt_char
        switch (id -u)
            case 0
                set -g __fish_prompt_char '#'
            case '*'
                set -g __fish_prompt_char '⋊>'
        end
    end

    # Setup colors
    set -l hostcolor (set_color (uname -n | md5sum | cut -f1 -d' ' | tr -d '\n' | tail -c6))
    set -l normal (set_color normal)
    set -l white (set_color FFFFFF)
    set -l turquoise (set_color 5fdfff)
    set -l orange (set_color df5f00)
    set -l hotpink (set_color df005f)
    set -l blue (set_color blue)
    set -l limegreen (set_color 87ff00)
    set -l purple (set_color af5fff)

    # Configure __fish_git_prompt
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_color 5fdfff
    set -g __fish_git_prompt_color_flags df5f00
    set -g __fish_git_prompt_color_prefix white
    set -g __fish_git_prompt_color_suffix white
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_show_informative_status true

    set -l current_user (whoami)

    ##
    ## Line 1
    ##
    echo -n $normal'['$hotpink$current_user$white'@'$orange$__fish_prompt_hostname$normal']:'$hotpink(pwd|sed "s=$HOME=~=")$normal
    __fish_git_prompt " (%s)"

    ##
    ## Line 2
    ##
    #echo -n $hostcolor''

    # Disable virtualenv's default prompt
    set -g VIRTUAL_ENV_DISABLE_PROMPT true

    # support for virtual env name
    if set -q VIRTUAL_ENV
        echo -n "($turquoise"(basename "$VIRTUAL_ENV")"$white)"
    end

    ##
    ## Support for vi mode
    ##

    set -l tomita_vi_mode "$TOMITA_VI"

    if test -z (string match -ri '^no|false|0$' $tomita_vi_mode)
        printf '['
        switch $fish_bind_mode
            case default
                set_color --bold blue
                printf n
            case insert
                set_color --bold green
                printf i
            case visual
                set_color --bold magenta
                printf v
        end
        set_color normal
        printf '] '
    end
    echo

    set_color -o yellow
    #printf '⋊> '
    #set_color normal
    ##
    ## Rest of the prompt
    ##
    echo -n $__fish_prompt_char $normal
end
