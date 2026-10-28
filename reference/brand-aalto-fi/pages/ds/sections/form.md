# ds/sections/form

<!-- prismic type: design_system_content · uid: _ds_sections_form · lang: en-eu ·
     last published: 2025-03-05T20:13:08+0000 · source: https://brand.aalto.fi/ds/sections/form -->


<!-- slice: hero -->

## Form

Form is a standardised way to collect information from users.

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

Forms are for collecting various types of information. They can consist of [Text Inputs](/ds/components/text-input), [Text Areas](/ds/components/text-area), [Dropdowns](/ds/components/dropdown), [Radio Groups](/ds/components/radio-group), [Checkbox Groups](/ds/components/checkbox-group), and so on.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Examples

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Aside on the right

A form may have an optional aside, in this example a ProfileCard

**page_section_element.component_id:** sections/form--with-provider-success

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Aside on the left

Depending on the type of the aside, it may also be placed on the left hand side of the Form

**page_section_element.component_id:** sections/form--with-text-chapter-aside

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Usage

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Use forms for gathering information, but carefully think about which component is the best for each inquiry. Keep forms concise and focused. Collect only the necessary information.

It's important to note that the Form section is responsible solely for the user interface of the form. The backend implementation, which handles data processing and storage, needs to be developed separately based on the specific environment and requirements of your project. To assist developers in this process, there is an example dummy backend connector provided. Familiarising yourself with this example will help you implement your own backend connector in the most straightforward manner.

Within the Design System, all implemented form elements, such as Text Input and Dropdown, support validation, and standardised error display. To provide the best user experience, it is recommended to implement client-side form validation in addition to server-side validation. This ensures that errors can be caught and addressed in real time, reducing the need for round trips to the server.

<!-- layout: alignment=left, theme=neutral -->