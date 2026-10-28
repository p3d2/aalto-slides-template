# ds/components/text-input

<!-- prismic type: design_system_content · uid: _ds_components_text-input · lang: en-eu ·
     last published: 2024-08-16T10:55:46+0000 · source: https://brand.aalto.fi/ds/components/text-input -->


<!-- slice: hero -->

## Text Input

Text Input allows writing text on one line.

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

Text Input is a single line for entering and editing text, suitable for short amounts of text.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Examples

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Text input

**page_section_element.component_id:** components/text-input--full

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Usage

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Text Input is designed for entering concise information, such as names, phone numbers, or other short text single-line inputs. It does not expand vertically to accommodate larger amounts of text. In situations where users need to enter longer paragraphs or more extensive content, it is recommended to use a [Text Area](/ds/components/text-area) component instead.

When using a Text Input, it is important to carefully consider the copywriting of the hint and placeholder texts to ensure the user understands the intended meaning.

Text Input variants provide enhanced control over the type of characters allowed in the input field. These variants enable you to enforce specific input formats, such as numeric values or valid email addresses. It is essential to select the appropriate input type, particularly on mobile devices, as modern browsers can display specialised virtual keyboards tailored to the input requirements.

When working with Text Input, validation of the input content is often necessary, especially when used within a Form. Validation ensures that required fields are provided and that entered values meet the specified criteria. The Text Input API offers the flexibility for developers to implement custom validation logic and provide custom error messages for different use cases.

<!-- layout: alignment=left, theme=neutral -->