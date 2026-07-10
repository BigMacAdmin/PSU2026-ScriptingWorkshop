# About "Not a Real AGENTS.md"

`Not a Real AGENTS.md` actually is a real `AGENTS.md` file. It just isn't the `AGENTS.md` for *this* repository.

Instead, it's an example you can copy, modify, and use in your own projects.

The `AGENTS.md` project describes these files as "a README for AI agents." They provide project-specific context that helps AI coding assistants understand how a project works before they start writing or changing code. You can learn more at https://agents.md/.

Read `Not a Real AGENTS.md` and you'll understand what we're trying to do with an AGENTS.md.

Our example focuses on something the generic examples don't: writing shell scripts for MacAdmins. (Also our example follows closely what Adam uses in his Jamf environment, obviously you can modify it to match a different MDM)

Most AI models have seen far more application code than MacAdmin scripts. They tend to assume a script is run interactively by the person sitting at the keyboard. That's a reasonable assumption but it doesn't match how most MacAdmin scripts are executed.

Our scripts commonly run:

* From an MDM
* As `root`
* With or without a logged-in user
* Without a Terminal session
* During enrollment or Setup Assistant
* Across hundreds or thousands of Macs

Without that context, an AI may generate a script that works fine in Terminal but fails when deployed by an MDM. Common mistakes include prompting for user input, assuming `$HOME` belongs to the intended user, using `sudo` unnecessarily, or expecting a GUI to be available.

The goal of this file is to prevent those mistakes before they happen. It documents the execution environment, coding standards, and conventions that aren't obvious from the code alone.

## How to Use This File

Copy it into the root of one of your own repositories and rename it AGENTS.md. When you use AI inside of a text editor, it will automatically read AGENTS.md if it exists in the open repo.

Next, update it to match your environment. Add your own coding standards, preferred logging methods, testing requirements, reusable functions, deployment practices, and anything else an AI should know before writing code for *your* organization.

You can also paste part or all of this document into a conversation before asking an AI to write or review a script.

As you use AI, you'll probably notice the same mistakes appearing more than once. When that happens, add another instruction to your `AGENTS.md`. Over time, the file becomes a collection of the context you no longer have to repeat.

This example reflects one way to write an `AGENTS.md`, not the only way. Keep what works, remove what doesn't, and change it as your standards evolve.
