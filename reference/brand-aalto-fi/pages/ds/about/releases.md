# ds/about/releases

<!-- prismic type: design_system_content · uid: _ds_about_releases · lang: en-eu ·
     last published: 2026-02-17T10:35:19+0000 · source: https://brand.aalto.fi/ds/about/releases -->


<!-- slice: hero -->

## Releases & roadmap

<!-- layout: theme=black -->

<!-- slice: text_and_image_section -->

The Aalto design system is not a static set of instructions but instead keeps changing on a constant basis. In order to maintain its value and relevance for users, the design system must adapt to feedback from users, advancements in technology, evolving design trends, and new business requirements.

<!-- layout: theme=neutral, alignment=left, aspect_ratio=hd -->
**text_and_image_section.image:** <https://images.prismic.io/aalto-master-design-system/eeb7a848-0507-41a9-a64b-6e9fbf0fc489_Aalto+DS+photoshoot+08.jpg?auto=compress,format&rect=133,0,2135,1601&w=640&h=480>


<!-- slice: page_section_element -->

The Aalto design system is not a static set of instructions but instead keeps changing on a constant basis. In order to maintain its value and relevance for users, the design system must adapt to feedback from users, advancements in technology, evolving design trends, and new business requirements.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Roadmap

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Roadmap for 2026 includes:

- Support for projects using the design system

- Sharing the design system more openly to students and staff

- New icons
- Updates to components, modules and sections, for example the top navigation
- Visual templates or examples for infographics, newsletter etc.

If you want to see certain components, modules or sections in the design system, please contact the team through the [support form](/support).

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Past releases

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 17/11/2025

- **Platform version update: **Now using Storybook 10 and Node 22.

- Minor bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 30/10/2025

- **Major package restructuring: **The *@aalto-dx/react-modules* package has been deprecated. All Components, Modules, and Sections are now consolidated under *@aalto-dx/react-components*. This change simplifies library maintenance, supports future development, and makes it easier for users to integrate the design system into their projects. Documentation for all Elements is now unified in a [single Storybook](https://dx-react-components.aalto.fi/?path=/docs/about--docs), offering a more seamless developer experience. Although this is a structural change, the update is straightforward: simply replace dependency to *@aalto-dx/react-modules* with the latest version of *@aalto-dx/react-components* in your project. All Modules and Sections retain their existing names and props.

- **New colour tokens: **The Base tier now includes a set of solid colours designed for use in contexts where transparent shades are not suitable.

- Minor bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 13/10/2025

- **New components** [Button group](/ds/components/button-group) and [Chip group

- **More flexibility for some old components**: [Side navigation](/ds/modules/side-navigation) with additional elements, static [List](/ds/components/list) without links

- Misc styling changes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 08/09/2025

- Minor bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 25/08/2025

- Minor bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 20/08/2025

- Better structure and re-usability for [Info](/ds/modules/info), which is now a module instead of a component. New module [Info Item](/ds/modules/info-item). This changes slightly the props and behaviour of related [Directory Block](/ds/modules/directory-block), [Directory](/ds/sections/directory) and [Hero](/ds/sections/hero), so if you’re using those elements please revisit your implementation.

- Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 10/06/2025

- New section [Directory](/ds/sections/directory) and related module [Directory Block

- Further HTML structure and keyboard navigation improvements

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 19/05/2025

- Misc **accessibility enhancements**. Improved keyboard navigation and screen reader support for various elements. Tooltips are now more mobile-friendly, and limited to relevant components only.

- Some HTML structures were changed and simplified, so check your code especially if you've made custom CSS modifications.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 13/05/2025

**- Templates** added. This is a new category of design system elements, allowing for quickly creating complete pages for common use cases. You can find the template [descriptions](/ds/templates) on this website, and the templates themselves in the Figma Starter Kit file.

- Minor **documentation improvements

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 29/04/2025

**- New icons** added e.g. for AI and social media channels

**- Documentation improvement**: all React components now have their properties documented in the code and Storybook

- Misc tweaks and fixes, better typing in the React library

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 07/03/2025

- **New sections** for horizontal content browsing: [Card Strip](/ds/sections/card-strip), [Content Box Strip](/ds/sections/content-box-strip), and [Image Tile Strip](/ds/sections/image-tile-strip), providing more flexible ways to showcase dynamic content

- **New component** [Mega Link](/ds/components/mega-link), a more prominent alternative to a standard Link that allows displaying additional information

- Enhanced [Card](/ds/modules/card) and [Content Box](/ds/modules/content-box) modules with **new variants**, making them more versatile for different content types

- **Improved layout consistency** across existing sections. Some element properties were also slightly restructured, but these changes should not impact most design system users

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 19/11/2024

- **Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 24/09/2024

- **New elements for entering dates**: [Date Picker](/ds/modules/date-picker), [Date Input](/ds/modules/date-input) and [Date Picker Modal

**- SSR / Next.js support** for React libraries: The React components can now be used in a Next.js project utilising server side rendering. Interested developers should take a look at the examples in the **Next.js starter kit **available in the *react-starter* repository. There was also a generic **version upgrade** bringing all development tools and third party packages up to date.

- **Bug fixes. **Includes a design token naming fix which might require changes to users’ code.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 22/08/2024

**- React Code Examples:** Big news for those utilising the React implementation of the design system: every component, module, and section now includes a code snippet to demonstrate how to integrate it into your codebase. This enhancement should significantly simplify the process of getting started with the design system in React-based projects.

**- Static Starter Kit:** For users unable to install design system resources via npm, we've introduced a static starter kit. This kit provides an alternative way to incorporate essential design system assets into your project. For more details, refer to the [developer instructions](/ds/for-developers/scenarios).

**- Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 26/06/2024

- **Icons update**. We've added a significant number of new icons to our collection. For a complete list, please refer to the [icon tokens page](/ds/tokens/icons). Additionally, we have revised the naming convention to make the icons use-case agnostic. If you've been using icons previously in your code, you may need to update some of the icon names to align with the new naming logic.

- **Easing functions** were added as design tokens and can be found on the [motion tokens page](/ds/tokens/motion).

**- Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 18/06/2024

*** Typography updates: **New tokens for letter spacing and paragraph spacing, applied to generic typography styles.

* Related to previous, **multi-paragraph content** support added for [TextChapterBlock](/ds/modules/text-chapter-block)/[TextChapter](/ds/sections/text-chapter), [CTA](/ds/sections/cta) and [TextAndImage](/ds/sections/text-and-image).

*** Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 12/06/2024

*** New elements: [Stepper](/ds/modules/stepper) module visualises a lengthy process. [Stepper section](/ds/sections/stepper-section) wraps a Stepper in a responsive container.

*** Form improvement: **It is now possible to add a [Title block](/ds/modules/title-block) as an aside to a [Form](/ds/sections/form), useful mostly in the context of short forms such as subscribing to a newsletter etc.

*** Bug fixes** and minor site improvements

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 10/06/2024

*** Motion design principles **added to Design System [documentation](/ds/for-designers/motion-design).

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 18/04/2024

*** New components: [Progress Indicator](/ds/components/progress-indicator) displays an infinity spinner, for example when loading is in progress.** **Switch](/ds/components/switch) is a simple gadget for toggling something on and off.

*** API update: **All components now have a *className* property, which makes it easier to customise the components or use them for example in Tailwind-based projects.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 10/04/2024

*** New section added**: [Modal](/ds/sections/modal) opens a dialog window on top of the rest of the UI

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 03/04/2024

*** New Hero variant. **Allows configuring a [Hero](/ds/sections/hero) with a full-width image and no additional text.

* Misc site improvements.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 02/04/2024

*** New sections added. [Logo wall](/ds/sections/logo-wall) and [Mega links](/ds/sections/mega-links).

*** Custom icons.** The [Icon component](/ds/components/icon) now allows displaying a custom icon e.g. from a SVG file.

*** Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 26/03/2024

*** Typography updates. **Bolder font sizes on large viewports.

*** Hero section changes. **New layout and structure for Hero section and Info component. This is a breaking change with changed React component props.

*** Video in Liftup and Image Tile. **These modules may now contain video instead of an image.

*** Misc improvements. **Bug fixes, layout tweaks, accessibility improvements.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 16/01/2024

*** Tech stack stability improvements. **Fixed cross-platform issues.

*** New components added. **Image Tile and Image Tile Collection for displaying plain images on a page.

*** Developer tooling improvement. **Package react-modules now exposes more utility classes for building custom modules.

*** Mobile site improvements. **Content optimisation.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 20/11/2023

*** Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 17/11/2023

*** Visual tweaks

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 16/11/2023

*** Improved token presentation

*** Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 07/11/2023

*** Visual polishing

*** Bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 03/11/2023

*** Visual polishing. **Smoother transitions, fine tuning the layouts.

*** Minor bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 30/10/2023

*** Design token presentation pages renewal. **Up-to-date descriptions and instructions for the various parts of the token system.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 17/10/2023

*** Accessibility improvements**. Easier navigation with keyboard only.

*** Bug fixes, visual tweaks

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 10/10/2023

*** Storybook content update.** More realistic example data.

*** Storybook version upgrade.** Resolves issues for Safari users.

*** Performance and accessibility improvements

*** Bug fixes, visual tweaks

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 05/10/2023

*** Visuals revamp.** Colour adjustments. Layout, paddings and weirdly stretching elements fixed here and there.

*** Performance improvements. **Hefty boost for page loading, improving the UX especially for users with slow internet connection.

*** Misc technical improvements. **Bug fixes, codebase clean-up, better developer documentation.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 29/09/2023

*** Font rendering and icon facelift** affecting especially the UX on iPhone and desktop Safari

*** Misc minor improvements**. Visual tweaks, bug fixes, faster page loading

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 28/09/2023

*** New components and modules**. Highlight, Text and image, Video player section

*** Misc minor improvements**. Module reorganising, bug fixes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 26/09/2023

*** Design updates.** Typography and usage of brand colours have been revised. Most components and modules got at least a minor facelift, while some were completely re-designed.

*** Dark mode.** All components and modules now support dark mode. The Brand site will display itself in dark mode based on the operating system setting.

*** Misc Brand site improvements**. Breadcrumbs, 404 page, more coherent structure, usage of the new modules etc.

*** Feedback form** was added to relevant pages, allowing the community to contribute to Design system development more effortlessly.

*** Major tech stack upgrade.** The React component library as well as the site itself are now built using a more modern tech stack based on Vite. Server upgrades. These changes don’t have any impact on how the components are used in channels, but under the hood this update contributes to a more robust and well performing foundation in the long run.

*** Static HTML** is now shown for most component and modules, enabling development of non-React versions of the component libraries

*** Updates to old components and modules**. Improved programming interfaces, more configuration options and variants, accessibility improvements.

*** Dependency to React Router was removed** from the React component libraries. An implementing channel may now inject its own router solution, or choose to do nothing and fall back to using basic HTML anchor tags. This means the channels may utilise the library no matter which router they rely on.

*** New components and modules**. Quick Links

*** New icons** added to the Aalto icon set

*** Storybook improvements**. Better stories, better organised.

*** Bug fixes and codebase refactoring**. A plentitude of small glitches was ironed out and developer friendliness is now highly improved.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### 20/06/2023

*** Beta launch**. The initial release was available for a limited audience.

<!-- layout: alignment=left, theme=neutral -->