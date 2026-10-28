# ds/tokens/colours

<!-- prismic type: design_system_content · uid: _ds_tokens_colours · lang: en-eu ·
     last published: 2025-10-30T11:23:32+0000 · source: https://brand.aalto.fi/ds/tokens/colours -->


<!-- slice: hero -->

## Colours

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

Consistent use of colour is a vital component of maintaining a cohesive and in-brand visual language. In the Aalto design system colours are mainly used on background surfaces to highlight important parts of a page or a screen. All actionable interface elements are neutral coloured, meaning white or shades of grey depending on the background they are placed on.

This page explains the colours as tokens in the design system. If you're interested in the colour usage from our brand perspective, visit the [Colours](/brand/visual-guidelines/colours) page under Visual guidelines.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Base palette

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Base palette includes all the colours of the system. These colours should not be used by directly copying the HEX value, but rather by using tokens to call for the correct colour. This is to reduce the strain of memorising values and to ensure accessibility of the final product, but will also make system wide colour changes easier.

There are five groups in the Base palette. These groups are

**- Aalto Brand**: Colours and tints for Aalto's brand colors.
- **School**: Colours and tints for Aalto's six schools.
- **Neutral**: Greyscale colours that form the basis of any interface and interactive element.
- **Transparent**: Transparent colours that are used to create states for interactive elements.
- **Tint**: Solid colour alternatives to the Transparent group, intended for cases where semi-transparent layers cannot be used due to technical or other limitations.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: tokens_section -->

**tokens_section.tier:** base

**tokens_section.group:** color


<!-- slice: page_section_element -->

###### Themes

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Themes are colour collections that define the colours for light and dark modes as well as brand and school coloured elements. A theme defines the values for each usable colour to keep the system accessible.

A neutral theme, light or dark, is always the basis of a page or screen. On top of this sections can have their own themes. Different sections have different limitations on which themes can be used. For example, cards are always used with neutral themes. Obviously themes Light and Dark are never used in the same layout.

The leading thought is that bright colours from brand and school themes are used on sections that have important information and thus need to be highlighted.

There are a total of 12 themes which are divided into three groups. These groups are Neutral, Brand and School.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Neutral

Neutral theme includes light and dark modes and is the default for all pages. In most environments, the mode is typically chosen based on operating system or browser setting.

**- Light** is the default theme for light mode 
**- Dark** is the default theme for dark mode

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Brand

Themes for Aalto’s brand colours that are used to highlight sections.

- Aalto Yellow
- Aalto Blue
- Aalto Red
- Aalto Black

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### School

Themes for each school of Aalto University that are used in school specific sections.

- School of Engineering (ENG)
- School of Chemical Engineering (CHEM)
- School of Electrical Engineering (ELEC)
- School of Arts, Design and Architecture (ARTS)
- School of Business (BIZ)
- School of Science (SCI)

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: tokens_section -->

**tokens_section.tier:** semantic

**tokens_section.group:** color.theme

Name,Reference,Selector


<!-- slice: page_section_element -->

###### Usable palette

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Colours are used by their semantic names to simplify colour selection and usage. These names signify the intended use of the colours and act as guides when building a product. While building there is no need to concentrate on colour values or themes but rather choosing the correct name for the use case.

There are a total of 16 colours divided into three groups. These groups are Basic, Action and Action Reversed.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Basic

Basic group covers the most common use cases in any interface.

**- Background** is the default page and screen background colour
**- Background Tint** is an optional background colour for dividing sections from each other
**- Foreground** is the default colour for titles and high contrast text elements
**- Foreground Tint** is the default for body text and less prominent elements
**- Surface** is a background colour for cards and other lifted elements
**- Subtle** is a low contrast colour for nuanced elements such a dividers

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: tokens_section -->

**tokens_section.tier:** semantic

**tokens_section.group:** color.theme

**tokens_section.variable_map:** basic


<!-- slice: page_section_element -->

###### Action and Action reversed

Action and Action reversed are used for all interactive elements. These groups are identical in logic, but one is dark and the other is light. Action group is the main action colour in every theme, whereas Action reversed is used when contrasting elements are needed inside these actions.

For example, in the primary button the button background is filled with the Action colour and button label is filled with the Action Rev colour. Different states are built by adding a contrasting fill colour to the button background.

**- Action** is the default colour for interactions
**- Action Reversed** is used for adding contrasting elements on top of the action colour
**- Hover** or **Hover Reversed** is used to indicate a hovered state depending on the background colour of the element
**- Active** or **Active Reversed** is used to indicate an active state depending on the background colour of the element
**- Disabled** or **Disabled Reversed** is used for disabled elements
**- Selected** or **Selected Reversed** is used to indicate a selected state depending on the background colour of the element

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: tokens_section -->

**tokens_section.tier:** semantic

**tokens_section.group:** color.theme

**tokens_section.variable_map:** action

Action


<!-- slice: tokens_section -->

**tokens_section.tier:** semantic

**tokens_section.group:** color.theme

**tokens_section.variable_map:** actionReversed

Action reversed
