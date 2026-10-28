# ds/tokens

<!-- prismic type: design_system_content · uid: _ds_tokens · lang: en-eu ·
     last published: 2025-03-07T14:33:40+0000 · source: https://brand.aalto.fi/ds/tokens -->


<!-- slice: hero -->

## Design tokens

Design tokens define visual property values for consistent use across channels and platforms. They underpin the Aalto design system, providing a universal source of truth for design, ensuring cohesion, and promoting effective collaboration between designers and developers. This streamlines the design and development process, reducing errors, simplifying design management, and enhancing the overall product quality.

<!-- layout: theme=black -->

<!-- slice: content_tile_collection -->

<!-- layout: tiles_per_row=3 -->
View tokens

<!-- layout: theme=neutral, skim=none -->
**content_tile_collection[0].image:** <https://images.prismic.io/aalto-master-design-system/Z8sDcxsAHJWomO6H_c01Tokens-TokenGroups-Colors.png?auto=format,compress&rect=0,0,2240,1260&w=640&h=360>

###### Colours

**content_tile_collection[0].cta_link:** internal `_ds_tokens_colours`

<!-- layout: image_aspect_ratio=hd -->
**content_tile_collection[1].image:** <https://images.prismic.io/aalto-master-design-system/Z8sDeBsAHJWomO6M_c01Tokens-TokenGroups-Typography.png?auto=format,compress&rect=0,0,2240,1260&w=640&h=360>

###### Typography

**content_tile_collection[1].cta_link:** internal `_ds_tokens_typography`

<!-- layout: image_aspect_ratio=hd -->
**content_tile_collection[2].image:** <https://images.prismic.io/aalto-master-design-system/Z8sDdBsAHJWomO6I_c01Tokens-TokenGroups-Grids%26Spacing.png?auto=format,compress&rect=0,0,2240,1260&w=640&h=360>

###### Grids & spacing

**content_tile_collection[2].cta_link:** internal `_ds_tokens_grid`

<!-- layout: image_aspect_ratio=hd -->
**content_tile_collection[3].image:** <https://images.prismic.io/aalto-master-design-system/Z8sDdRsAHJWomO6J_c01Tokens-TokenGroups-Icons.png?auto=format,compress&rect=0,0,2240,1260&w=640&h=360>

###### Icons

**content_tile_collection[3].cta_link:** internal `_ds_tokens_icons`

<!-- layout: image_aspect_ratio=hd -->
**content_tile_collection[4].image:** <https://images.prismic.io/aalto-master-design-system/Z8sDdhsAHJWomO6K_c01Tokens-TokenGroups-Motion.png?auto=format,compress&rect=0,0,2240,1260&w=640&h=360>

###### Motion

**content_tile_collection[4].cta_link:** internal `_ds_tokens_motion`

<!-- layout: image_aspect_ratio=hd -->

<!-- slice: page_section_element -->

###### Token naming

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

In the Aalto design system, design tokens follow a semantic naming structure. This means that the names of the tokens indicate their purpose and where they belong in the hierarchy. Rather than specifying the specific value of a variant, the token names emphasize their intended usage. Semantic naming simplifies future updates to the token system, making it easier to modify or expand the system as needed. Furthermore, it enables the tokens to serve as a foundation for sub-brands, student explorations, or other derivative applications.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Elements of a token name

The full name and hierarchy of a token can be expressed as 
*Namespace - Tier - Type - Families - Instance

**Namespace**: A prefix for avoiding naming conflicts between Aalto tokens and other libraries; always *aalto**
Tier**: Foundational value (*base*), reference value (*alias*) or a contextful value (*semantic*)
**Type**: Token category, for example, *color*, *dimension,* or *transition**
Families**: One or more semantic subcategories, for example, *action / on light *for a colour indicates it belongs to the category of action colours and is intended to be used on a light background
**Instance**: The unique name of the token, differentiating it from all other tokens with the same semantic grouping

For example, a colour token might be described as 
*Aalto - Alias - Color - Action - On Light - Hover

As tokens exist in multiple file formats, naming details may vary slightly to reflect the different conventions of the language. Our example colour token would thus be called
*--aalto-alias-color__action-on-light--hover
*in CSS, but 
*.aalto.alias.color.action.onLight.hover
*in JSON.

For convenience, the token listing pages allow copy-pasting of the token's CSS name to the clipboard.

<!-- layout: alignment=left, theme=neutral -->