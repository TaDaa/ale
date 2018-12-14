function! ale_linters#swift#swiftlsp#Command(buffer)
    return '/Users/tlovell/Documents/workspace/sourcekit-lsp/.build/debug/sourcekit-lsp'
endfunction

function! ale_linters#swift#swiftlsp#Executable(buffer)
    return '/Users/tlovell/Documents/workspace/sourcekit-lsp/.build/debug/sourcekit-lsp'
endfunction

function! ale_linters#swift#swiftlsp#FindProjectRoot(buffer) abort
    let l:swift_config = ale#path#FindNearestFile(a:buffer, 'Package.swift')
    if !empty(l:swift_config)
        return fnamemodify(l:swift_config, ':h')
    endif
endfunction

call ale#linter#Define('swift', {
\   'name': 'swiftlsp',
\   'lsp': 'stdio',
\   'executable_callback': 'ale_linters#swift#swiftlsp#Executable',
\   'command_callback': 'ale_linters#swift#swiftlsp#Command',
\   'project_root_callback': 'ale_linters#swift#swiftlsp#FindProjectRoot',
\   'language': 'swift',
\})
