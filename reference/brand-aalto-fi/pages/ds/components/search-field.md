# ds/components/search-field

<!-- prismic type: design_system_content · uid: _ds_components_search-field · lang: en-eu ·
     last published: 2024-08-16T10:30:34+0000 · source: https://brand.aalto.fi/ds/components/search-field -->


<!-- slice: hero -->

## Search Field

Search Field helps users find specific information by keywords.

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

Search Field is a UI component that includes a text input box, a search button, and optionally, a dropdown list displaying predefined options or previous search results.

Search Field component focuses solely on the user interface aspect of search functionality. The process of querying data, such as retrieving information from a database or content management system, is implemented separately. Ideally, a continuous search should be implemented, where the results are updated dynamically as the user types into the input field. However, in some cases, immediate updating may not be feasible due to specific environmental constraints. In such situations, clicking the search button will trigger a fresh search and retrieve the most up-to-date results.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Examples

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Search field

**page_section_element.component_id:** components/search-field--default

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Usage

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Search Field facilitates fast information retrieval from a large dataset. It empowers users who have a clear understanding of what they are looking for and can provide appropriate search terms. However, it is important to note that Search Field is not suitable for browsing or discovering previously unknown content. It is not intended to serve as the primary means of navigation on a page or site, but should only provide a complementary mechanism to for example [Top Navigation](/ds/sections/top-navigation) and [Links](/ds/components/link).

<!-- layout: alignment=left, theme=neutral -->