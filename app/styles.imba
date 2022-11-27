global css
	@root
		bgc: black

	*
		tween: all 500ms ease

	a 
		font-weight: 500;
		color:rose4 @hover:violet4;
		text-decoration: inherit;

	nav
		pos:sticky
		t:0 r:0 l:0
		d:flex
		jc:space-between
		ai:center
		p: 0 2em
		bgc:black
		max-width: 1280px;
		margin: 0 auto;
		rd@xl:0 0 1em 1em

	nav
		h1	
			cursor: pointer
			us:none
			m:1em 0

		aside
			bgc: inherit
			pos: fixed
			t:0 r:0 b:0
			pt:3em

		ul
			list-style: none
			p: 2em
			max-width: 1280px;
			margin: 0 auto;

		ul
			li
				lh:2
				fs:1.2em
				font-weight: 500;
				color: fuchsia1 @hover:fuchsia4;
				text-decoration: inherit;
				cursor:pointer

	main
		img w:100%

		h2
			m: 2em 0
		
		h2, ol
			max-width: 1280px;
			margin: 0 auto;
