# Clipboard Wizard

The Clipboard Wizard addon will set the Windows clipboard with text from an item record when the item form is opened.

## Addon Settings

CopyFormatString
:	The formatting that will be used to set text in the windows clipboard. The CopyFormatString allows tags to be used that will be replaced by the addon when the form is opened.
: 	Default: {TableField:Item.Title}

## Tagging
The tagging syntax will look for values inside of curly braces. i.e. { }. The TableField type of replacement will retrieve a value from an Ares table and field. The format is the TableName, followed by a period, followed by the FieldName. Item and Course are the only allowed table names for tag replacement.

### Example

Provided the item record's title is "The Cat in the Hat" and author is "Dr. Seuss".

	CopyFormatString: {TableField:Item.Title} / {TableField:Item.Author}
	Replacement: The Cat in the Hat / Dr. Seuss
	
