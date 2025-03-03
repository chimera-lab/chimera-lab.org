# Chimera-lab - README Documents Syntax Rules

These rules should be applied to every README document present on the organization. It create a pattern that can be easily understood.

## Repository

### Name

- Repository should always have a suffix name, use an appropriated organization template to name it.

### Projects

### Commits

### Issues

#### Milestones

#### Labels

- bug
  - Something isn't working
- documentation
  - Improvements or additions to documentation
- duplicate
  - This issue or pull request already exists
- enhancement
  - New feature or request
- good first issue
  - Good for newcomers
- help wanted
  - Extra attention is needed
- invalid
  - This doesn't seem right
- question
  - Further information is requested
- wontfix
  - This will not be worked on

### Branchs

### Templates

- Version must be present as `<!--(version=a.b.c)-->`.
  - 'a' - changes require revision.
  - 'b' - changes can be resolved.
  - 'c' - changes can be ignored.
- Any change to the template that modifies the document structure should have its version updated.
- Every header should have an emoji prefix as documented in [Document Headers](#document-headers)

#### List of Templates

- template.template
  - topic.template
  - overview.template
  - diy.template
  - scaffold.template
    - docker_scaffold.template
  - app.template
    - laravel_app.template
  - project.template
  - org.template

#### Child MarkDown Documentation

Child documents should be presented in the template prefixed with "README.".

#### Document Headers

Document headers must always have an emoji, must match the following terms or be the same as the previous header.

##### :paperclip: Appendix

##### :book: Chapter

##### :hammer_and_wrench: Common problems

##### :wrench: Configuration

##### :busts_in_silhouette: Contributing

##### :medal_military: Credits

##### :control_knobs: Customization

##### :page_facing_up: Files

##### :inbox_tray: Installation

##### :loudspeaker: Introduction

##### :package: Material

##### :notebook: Notes

##### :telescope: Overview

##### :books: References

##### :clipboard: Requirements

##### :link: See also

##### :gear: Software

##### :building_construction: Structure

##### :newspaper: Sources

##### :file_cabinet: Submodule

##### :triangular_ruler: Technologies

##### :mag: Terminology

##### :memo: To-do list

##### :toolbox: Tools

##### :keyboard: Usage

##### :scroll: License

##### :warning: Warnings

#### Link prefixes

##### :globe_with_meridians: External link

##### :file_cabinet: Chimera LAB's repositories

##### :file_folder: Other repositories

##### :mag: Terms

#### Links

- External link names shoud be prefixed with `:globe_with_meridians:` :globe_with_meridians:.
  - Example: `:globe_with_meridians: [Wikipedia](https://www.wikipedia.org/)` [:globe_with_meridians: Wikipedia](https://www.wikipedia.org/)

- Link associated to Organization repositories shoud have their name prefixed with `:open_file_folder:` :open_file_folder:.
  - Example chimera-lab: `[:open_file_folder: Chimera-lab](https://github.com/chimera-lab/chimera-lab)` [:open_file_folder: chimera-lab/chimera-lab](https://github.com/chimera-lab/chimera-lab)
  - Example others: `[:file_folder: github/docs](https://github.com/github/docs)` [:file_folder: github/docs](https://github.com/github/docs)

- Links related to Organization Terms should have their name prefixed with `:mag:` :mag:.
  - Example: `[:mag: Term](https://github.com/chimera-lab/template.topic?tab=readme-ov-file#repository)` [:mag: Term](https://github.com/chimera-lab/template.topic?tab=readme-ov-file#repository)

- Links related to the document should have their name prefixed with their icon as documented in  [Document Headers](#document-headers).
  - Example: `[:paperclip: Appendix](#paperclip-appendix)` [:paperclip: Appendix](#paperclip-appendix)
  - Example: `[:notebook: Notes](#notebook-notes)` [:notebook: Notes](#notebook-notes)
