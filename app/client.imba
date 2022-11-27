import './assets/app.css'

import './styles'

import data from './data.json'
import books_map from './books_map'

let showMenu = no


tag bible-maps
	def goToTopic item
		let element = document.getElementById(item.topic)
		element.scrollIntoView({ block: "start" })
		showMenu = no
		
	def parseLinks text
		unless text
			return

		text = text.replace(/(<[/]?span[^>]*)>/, '')	# Clean up unneeded spans
		text = text.replace(/( class=\'\w+\')/, '')	# Avoid unneded classes on anchors

		pieces = text.split("\"")

		result = ''
		for piece in pieces
			if piece.startsWith('B:')
				result += "'https://bolls.life/YLT/"
				digits = [...piece.matchAll(/\d+/g)]
				try
					result += books_map[(digits[0])] + '/' + digits[1]
				catch
					log piece

				if digits.length > 2
					result += '/' + digits[2]

				if digits.length > 3
					result += '-' + digits[3]

				result += "' target='_blank'"
			else
				result += piece
		return result

	def mount
		for item, index in data when item.definition
			data[index].definition = parseLinks(item.definition)
		console.log(data)
		imba.commit!

	def render
		<self>

			<nav>
				<h1[c:yellow4 pos:sticky zi:100] @click=(do showMenu = !showMenu)> "Bible Maps"

				if showMenu
					<aside[o@off:0 l:0rem l@off:2em scale@off:1.025 origin:top left] ease>
						<ul>
							for item in data when item.topic
								<li @click=goToTopic(item)> item.topic

			<main>
				for item in data
					<section id=(item.topic || item.image)>
						<h2> item.topic
						<img src="images/{item.image}">
						<div innerHTML="{item.definition || ''}">

			<p>
				"Check out"
				<a href="https://imba.io" target="_blank"> " Imba.io"
				", the Imba documentation website"



imba.mount <bible-maps>, document.getElementById('app')
