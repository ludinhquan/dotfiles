fu! SaveSess()
    execute 'SessionSave'
endfunction
autocmd VimLeave * call SaveSess()
