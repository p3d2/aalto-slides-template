# ds/modules/liftup

<!-- prismic type: design_system_content · uid: _ds_modules_liftup · lang: en-eu ·
     last published: 2025-06-16T16:34:33+0000 · source: https://brand.aalto.fi/ds/modules/liftup -->


<!-- slice: hero -->

## Liftup

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

The Liftup module is designed to promote key content with a single, clearly defined action. It may include a title, description, image, and a link or action.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Examples

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Small Liftup

Used when there are multiple Liftups per row

**page_section_element.component_id:** modules/liftup--small

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Large Liftup

Used when there is only one Liftup on a row

**page_section_element.component_id:** modules/liftup--large

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Liftup with a button

Instead of a link, Liftup may also contain a button in case the action is not a simple navigation

**page_section_element.component_id:** modules/liftup--small-with-button

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Video content

Instead of an image, Liftup may also contain video

**page_section_element.component_id:** modules/liftup--with-video

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Usage

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Use Liftup when the content leads to a non-navigational action such as downloading a file, opening a document, or triggering a tool. Unlike the [Card](/ds/modules/card), only the link or button is interactive, supporting focused user engagement.

Especially if the destination is another page within the same site, use a Card instead. For content that does not require interaction, use [Content Box](/ds/modules/content-box) or [Image Tile](/ds/modules/image-tile).

Groups of Liftups are typically arranged using a [Liftup Collection](/ds/sections/liftup-collection).

<!-- layout: alignment=left, theme=neutral -->