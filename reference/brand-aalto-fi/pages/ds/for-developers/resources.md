# ds/for-developers/resources

<!-- prismic type: design_system_content · uid: _ds_for-developers_resources · lang: en-eu ·
     last published: 2025-10-29T13:51:54+0000 · source: https://brand.aalto.fi/ds/for-developers/resources -->

**feedback_form:** internal `feedback`


<!-- slice: hero -->

## Available resources

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

###### Packages

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

The Aalto design system strives to be technology agnostic, ensuring that its components and assets are available across multiple technologies. As the design system continues to evolve, additional language implementations will be incorporated.

Currently, the following packages are available:
- **@aalto-dx/tokens**: Design tokens in CSS and JSON formats, and a custom CSS reset
- **@aalto-dx/react-components**: User interface elements (Components, Modules and Sections) for [React](https://react.dev/) projects
- **@aalto-dx/component-styles**: CSS styling for the UI elements used in non-React projects
- **@aalto-dx/react-starter**: Quick-start template project(s) exemplifying DS usage in a React channel

To start using any Aalto libraries in your project, you will need access to the Aalto Git package registry. The libraries are distributed as npm packages, so you must have npm installed. We recommend configuring registry access by using a *.npmrc* file. Additionally, ensure that your project is using compatible versions of node, npm, and relevant libraries such as React.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: content_tile_collection -->

<!-- layout: tiles_per_row=1, theme=neutral, skim=top -->
###### Credentials

Please contact the Aalto Design System team for more specific configuration instructions and package registry access tokens.

<!-- layout: image_aspect_ratio=hd -->

<!-- slice: page_section_element -->

###### Fonts

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Aalto University’s primary typeface is Inter:
[Download Inter

For web development however, it is often more efficient to import the font directly from Google Fonts in the *head* of your page, rather than downloading it:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

<head>
  <!-- ... -->

  <!-- Import the Aalto font (Inter) from Google -->
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap');
  </style>

  <!-- Preconnecting to the font file source (and other known resources) improves page loading speed -->
  <link rel="preconnect" href="https://fonts.gstatic.com" />

  <!-- ... -->
</head>

**page_section_element.code_language:** html

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Please note that, for the sake of modularity and performance optimisation, the font is NOT included in the aforementioned packages. You must thus include it separately in your project using your preferred method.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Storybook libraries

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In addition to the npm packages, developers can explore the implemented libraries through [Storybook](https://storybook.js.org/) sites. Storybook provides a dedicated environment for showcasing UI elements in various states, allowing developers to effectively view their props, explore different variations, and interact with them to observe their behavior in different scenarios.

Currently, the following Storybooks are provided:
[React Components

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: content_tile_collection -->

<!-- layout: tiles_per_row=1, theme=neutral, skim=none -->
###### What about content management?

The core concept of the design system is to offer users a comprehensive collection of versatile UI elements that can effectively present various types of content. It's important to note that content management systems (CMS) are not included in the design system's scope. Instead, individual channels are responsible for implementing their own CMS to manage and host content such as text and images. This separation allows the design system to focus on providing the necessary building blocks for consistent user interfaces while enabling full freedom of content management solutions at the channel level.

<!-- layout: image_aspect_ratio=hd -->

<!-- slice: page_section_element -->

###### Read next

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: content_tile_collection -->

<!-- layout: tiles_per_row=2, theme=neutral, skim=none -->
###### Scenarios

**content_tile_collection[0].cta_link:** internal `_ds_for-developers_scenarios`

<!-- layout: image_aspect_ratio=hd -->