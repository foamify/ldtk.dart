[LDtk](https://ldtk.io/) parser for Dart programming language

# Updating JSON schema
How to update:

1. Copy the contents of [LDtk json schema](https://ldtk.io/files/JSON_SCHEMA.json) and paste to [quicktype](https://app.quicktype.io/) 
2. Quicktype settings:
   - Source type = JSON Schema,
   - Language = Dart,
   - [x] Check 'Put encoder & decoder in Class'
3. After pasting, find `!,` and replace with `,`