// YourComponent.stories.tsx

import React, { ComponentProps } from "react";
import { Story } from "@storybook/react/types-6-0";

import { YourComponent } from "./YourComponent";

// This default export determines where your story goes in the story list
export default {
  title: "YourComponent",
  component: YourComponent,
};

const Template: Story<ComponentProps<typeof YourComponent>> = (args) => (
  <YourComponent {...args} />
);

export const FirstStory = Template.bind({});
FirstStory.args = {
  /* the args you need here will depend on your component */
};
