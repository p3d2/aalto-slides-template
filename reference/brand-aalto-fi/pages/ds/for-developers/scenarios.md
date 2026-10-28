# ds/for-developers/scenarios

<!-- prismic type: design_system_content · uid: _ds_for-developers_scenarios · lang: en-eu ·
     last published: 2025-10-29T14:08:43+0000 · source: https://brand.aalto.fi/ds/for-developers/scenarios -->

**feedback_form:** internal `feedback`


<!-- slice: hero -->

## Scenarios

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

###### 1. No technology

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In some cases, such as when designing for non-digital touchpoints or working on unconventional technical platforms, it may not be feasible to directly integrate the design system assets into the project on any level. The most basic approach to using the design system is to treat it simply as a valuable reference, independent of any specific technical dependencies.

This website, along with the accompanying Figma files, provides comprehensive guidance and inspiration that can greatly enhance any Aalto-related design process, regardless of the tools and technologies you may be using. However, in the vast majority of cases, it is still possible to at least manually import the essential elements like font files or colour codes.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: content_tile_collection -->

<!-- layout: tiles_per_row=1, theme=neutral, skim=none -->
###### Manual import

While the preferred method for integrating design system assets is via npm packages, there may be situations where importing npm packages isn't feasible. In such cases, you can manually copy the necessary files and code snippets into your codebase. This approach might be necessary if you're working on a legacy system with limited control over the technology stack, or simply want to experiment with the design system before making more significant changes to your workflow.

For scenarios like these, the @aalto-dx/react-components repository includes a straightforward static example of how to manually incorporate essential design system code into a web project. You can find the example files and detailed instructions in the static-starter folder located in the project root.

However, it's important to emphasise that this is not the recommended method for using the design system. We strongly advise aiming for a modern development setup that includes version control, preprocessing, bundling, and other best practices to ensure maintainability, efficiency, and overall software quality.

<!-- layout: image_aspect_ratio=hd -->

<!-- slice: page_section_element -->

###### 2. Only design tokens

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In certain situations, the complete utilisation of existing UI component libraries may not be feasible. This could be due to various factors, such as constraints imposed by legacy code bases, third-party solutions, or the team's familiarity with these libraries.

In such cases, a more lightweight approach might be to import only the design tokens (colours, typography etc.). This allows for a partial alignment with the brand, even when full library integration is challenging. The design tokens are accessible in various file formats, making them adaptable to different platforms, not limited to web applications.

First, install the package by running

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

npm install @aalto-dx/tokens --save

**page_section_element.code_language:** shell

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In most cases, you probably want to use the tokens as CSS variables. You can then import the tokens in CSS / SCSS as any other package, exact syntax depending on your project setup / bundler:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

@import '@aalto-dx/tokens';
@import '../../node_modules@aalto-dx/tokens';
@import '~@aalto-dx/tokens';

**page_section_element.code_language:** css

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Should you need access to the tokens as JSON, you can instead import e.g. in JavaScript / TypeScript:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

import tokens from '@aalto-dx/tokens/dist/tokens.json';

**page_section_element.code_language:** typescript

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 3. Novel technology stack

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In the ever-evolving landscape of frontend technologies, it is well possible that the design system may not (yet) offer a component library implemented in the framework you are currently using. In such a scenario, you have the option to import the component CSS alongside the design tokens. Additionally, this website provides static HTML code for each component, module, and section, serving as a reference and starting point for implementing the HTML components using your framework of choice. Obviously, the direct usability of this code may vary depending on your specific framework.

The workflow for importing the styling is similar to importing tokens described above. First install the package:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

npm install @aalto-dx/component-styles

**page_section_element.code_language:** shell

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Then take the package into use in your CSS/SCSS:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

@import '@aalto-dx/component-styles';
@import '../../node_modules@aalto-dx/component-styles';
@import '~@aalto-dx/component-styles';

**page_section_element.code_language:** css

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Remember to also [include the font file](/ds/for-developers/resources).

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 4. React channel

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Currently, the React implementation of the design system library is the most mature one. Unlike plain HTML/CSS, React components are fully functional, making them more readily usable in your projects. Especially when you're implementing a new channel without pre-existing technological constraints, employing React is most likely the most straightforward path to fully leverage the design system's benefits.

Most web-based channels can be constructed using the UI elements available in **@aalto-dx/react-components**. To install the package, execute the following command in the project's root directory (where the package.json file is located):

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

npm install @aalto-dx/react-components --save

**page_section_element.code_language:** shell

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Once installed, you can use the library by simply importing the relevant UI elements in your code:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

import { TextChapter } from '@aalto-dx/react-components';
...
<TextChapter title="My title" body="My body text" />

**page_section_element.code_language:** typescript

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

The Sections are ready to be employed as they are, without any modifications. However, if you are building custom elements, you should take closer look at the individual Components, Modules, and possibly also the design tokens.

The React packages include the styling for the elements, but you need to import the styles typically in your main CSS/SCSS:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

@import '@aalto-dx/react-components/dist/styles';

**page_section_element.code_language:** css

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

You must also [import the font file](/ds/for-developers/resources) separately.

Once again, if you discover that the existing UI elements are not suitable for your project, please get in touch with the design system team to explore the possibility of extending the core library.

Depending on the channel, populating the imported React components with data may require connecting to a content management system (CMS) or implementing more complex business logic. However, these aspects are beyond the scope of the design system.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: content_tile_collection -->

<!-- layout: tiles_per_row=1, theme=neutral, skim=none -->
###### Notes for React developers

- The Aalto React libraries are primarily built on a stack that includes React and TypeScript, with minimal additional dependencies. This deliberate choice offers the flexibility to seamlessly integrate our libraries with various React frameworks, like Vite or NextJS. While using TypeScript in the client channel is not mandatory, it is strongly recommended for an optimised development workflow.

- The components are intentionally designed not to manage their own state. This design allows you to integrate these components with a wide range of state management mechanisms.

- By default, the libraries generate plain HTML links for navigation. However, the architecture is built to support more advanced routing solutions. You have the freedom to inject your preferred router, such as React Router, by wrapping your application in the appropriate routing provider.

<!-- layout: image_aspect_ratio=hd -->

<!-- slice: page_section_element -->

###### 5. Sub-branding

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In some rare instances, there may be a need to create a channel that doesn't strictly adhere to the standard Aalto brand guidelines but is still unmistakably associated with Aalto. For example, an event or a student campaign might require a customised colour palette that deviates from the norm while retaining the Aalto logo, typography, user interface components etc. It's crucial to note that this practice is generally not recommended, and it's advisable to consult the brand team if such needs arise.

Many such custom modifications can be achieved by “hacking” the design tokens. Since all Components, Modules, and Sections use these tokens to define their appearance, altering token values will affect their usage throughout.

For instance, in the package **@aalto-dx/tokens**, a semantic background colour token is defined with the convenience name **--aalto-col-bg**. If, for any reason, you wish to change this colour for all user interface elements to a non-standard Aalto yellowish shade, you can override the default value simply by redefining the token in your own CSS:

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

.my-radical-channel {
  --aalto-col-bg: #bada55;
  /* or even */
  --aalto-col-bg: #bada55 !important;
}

**page_section_element.code_language:** css

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

The same approach can be employed to adjust other types of tokens, such as dimensions or typography.

It's important to note that any custom modifications should not compromise accessibility standards or other best practices upheld by the university.

<!-- layout: alignment=left, theme=neutral -->