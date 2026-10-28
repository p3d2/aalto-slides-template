# ds/tokens/motion

<!-- prismic type: design_system_content · uid: _ds_tokens_motion · lang: en-eu ·
     last published: 2024-06-26T10:03:12+0000 · source: https://brand.aalto.fi/ds/tokens/motion -->


<!-- slice: hero -->

## Motion

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

Animated graphics, videos, and other dynamic elements are integral to the Aalto design language. User interfaces may also include animated transitions and micro-interactions. However, it is essential to use motion thoughtfully to prevent distracting the user's attention from the primary content.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: tokens_section -->

### Transition

Transition tokens should be used to define the duration of short animations like mouse-over effects. There is no one-size-fits-all solution, and designers should consider both the desired impact and the size of the movement when selecting the appropriate duration.

**tokens_section.tier:** base

**tokens_section.group:** transition


<!-- slice: tokens_section -->

### Easing

Easing in animation refers to the way an animation progresses through its duration, affecting the motion's speed and acceleration. Instead of moving at a constant pace, easing functions create more natural and realistic movements by varying the rate of change.

The Aalto design system defines the following easing tokens:
**- In:** The animation starts slowly and accelerates towards the end. This is often used to simulate the way objects gain speed gradually.
**- Out:** The animation starts quickly and decelerates towards the end, mimicking the way objects slow down before coming to a stop.
**- In Out:** The animation starts slowly, speeds up in the middle, and then slows down again towards the end, providing a smooth and natural transition.

**tokens_section.tier:** base

**tokens_section.group:** easing
