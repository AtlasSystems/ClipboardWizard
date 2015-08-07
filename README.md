# Clipboard Wizard

The Clipboard Wizard addon will set the Windows clipboard with text from a record when the form is opened. The addon includes defaults for each product.

## Addon Settings

### ComparatorFormat

Defines the format string to retrieve data to determine if the PrimaryFormatString or SecondaryFormatString is used to copy data into the clipboard. A value of {Default} will set it based on the current product.

### ComparatorValue

Compared to the output of ComparatorFormat. If the value matches then PrimaryFormatString is used; otherwise, SecondaryFormatString is used. A value of {Default} will set it based on the current product.

### PrimaryFormatString
Defines the primary format string to copy data into the clipboard. A value of {Default} will set it based on the current product.

### SecondaryFormatString
Defines the secondary format string to copy data into the clipboard. A value of {Default} will set it based on the current product.

## Tagging Syntax

The tagging syntax will look for values inside of curly braces. i.e. { }. The TableField type of replacement will retrieve a value from a table and field. The format is the TableName, followed by a period, followed by the FieldName.

### Examples

All examples assume the following default settings.

	ComparatorFormat: {Default}
	ComparatorValue: {Default}

#### Aeon

Provided the request's ItemTitle is "The Cat in the Hat" and ItemAuthor is "Dr. Seuss".

	PrimaryFormatString: {TableField:Transaction.ItemTitle} / {TableField:Transaction.ItemAuthor}
	Replacement: The Cat in the Hat / Dr. Seuss

#### Ares

Provided the item's Title is "The Cat in the Hat" and Author is "Dr. Seuss".

		PrimaryFormatString: {TableField:Item.Title} / {TableField:Item.Author}
		Replacement: The Cat in the Hat / Dr. Seuss

#### ILLiad

Provided the request's RequestType is Loan, the LoanTitle is "The Cat in the Hat", and LoanAuthor is "Dr. Seuss".

	PrimaryFormatString: {TableField:Transaction.LoanTitle} / {TableField:Transaction.LoanAuthor}
	Replacement: The Cat in the Hat / Dr. Seuss
