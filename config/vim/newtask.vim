let g:hut_taskpath = '/home/hut/sync/notes/vimwiki/tasks/'
let g:hut_indexpath = '/home/hut/sync/notes/vimwiki/tasks/tasks.wiki'
function! NewTask()
	call inputsave()
	let name = input('Task name: ')
	call inputrestore()
	if strlen(name) > 0
		let fullname = strftime('%Y-%m-%d_').  name
		execute "silent !echo '- [ ] [[" . substitute(fullname, "'", "'\\\\''", '') . "]]' >> '" . g:hut_indexpath . "'"
		execute 'edit '.fnameescape(g:hut_taskpath . fullname . '.wiki')
	endif
endfun
nmap \wc :call NewTask()<CR>
