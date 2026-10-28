# ds/modules/stepper

<!-- prismic type: design_system_content · uid: _ds_modules_stepper · lang: en-eu ·
     last published: 2024-08-16T12:31:52+0000 · source: https://brand.aalto.fi/ds/modules/stepper -->


<!-- slice: hero -->

## Stepper

<!-- layout: theme=black -->

<!-- slice: page_section_element -->

Stepper visually represents the steps of a multi-step process or workflow. It guides users through a sequence of steps or stages, helping them understand their current position within the process and what steps remain.

Each step is represented as a node, often accompanied by a label, and these nodes are connected by lines to indicate progression. Completed steps feature a checkmark, current steps are highlighted, and future steps are outlined but inactive. This visual progression aids in setting expectations and providing feedback about the user's journey through the process.

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Examples

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Default

Typically, the Stepper starts with the first item selected and only allows progression to the next step once the current one is completed. Moving back to previous steps is not permitted.

**page_section_element.component_id:** modules/stepper--default

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Preselected

The Stepper merely reflects the state managed externally, allowing it to display any predefined state based on the surrounding business logic.

**page_section_element.component_id:** modules/stepper--preselected

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Allow revisiting

In some instances, it makes sense to permit users to revisit previously completed steps.

**page_section_element.component_id:** modules/stepper--allow-revisiting

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Allow skipping

Some processes are best facilitated by a Stepper that allows users to freely navigate between the steps.

**page_section_element.component_id:** modules/stepper--allow-skipping

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Hide inactive labels

Stepper can be configured to hide the labels of steps that are not currently active.

**page_section_element.component_id:** modules/stepper--hide-inactive-labels

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Without labels

Adding step labels generally enhances user comprehension, but it's also possible to use Stepper solely with numbered step indicators.

**page_section_element.component_id:** modules/stepper--without-labels

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

###### Usage

<!-- layout: alignment=left, theme=neutral -->

<!-- slice: page_section_element -->

Stepper is ideal for breaking down complex forms into manageable sections, guiding users through a series of introductory steps during onboarding processes, and assisting users in understanding the stages of e.g. a booking process.

Ensure each step has a clear and concise label that explains the action or content of that step. Avoid having too many steps as it can overwhelm users; keep it concise.

The Stepper module can be embedded in any UI, but it is generally more effective to use the full-width [Stepper Section](/ds/sections/stepper-section) instead.

<!-- layout: alignment=left, theme=neutral -->