(defparameter *all* '(
		      program
		      identifier
		      block
		      usesUnitsPart
		      labelDeclarationPart
		      label
		      constantDefinitionPart
		      constantDefinition
		      constantChr
		      constant
		      unsignedNumber
		      unsignedInteger
		      unsignedReal
		      sign
		      bool
		      string
		      typeDefinitionPart
		      typeDefinition
		      functionType
		      procedureType
		      type
		      simpleType
		      scalarType
		      subrangeType
		      typeIdentifier
		      structuredType
		      unpackedStructuredType
		      stringtype
		      arrayType
		      typeList
		      indexType
		      componentType
		      recordType
		      fieldList
		      fixedPart
		      recordSection
		      variantPart
		      tag
		      variant
		      setType
		      baseType
		      fileType
		      pointerType
		      variableDeclarationPart
		      variableDeclaration
		      procedureAndFunctionDeclarationPart
		      procedureOrFunctionDeclaration
		      procedureDeclaration
		      formalParameterList
		      formalParameterSection
		      parameterGroup
		      identifierList
		      constList
		      functionDeclaration
		      resultType
		      statement
		      unlabelledStatement
		      simpleStatement
		      simpleStmt
		      assignmentStatement
		      variable
		      expression
		      relationaloperator
		      simpleExpression
		      additiveoperator
		      term
		      multiplicativeoperator
		      signedFactor
		      factor
		      unsignedConstant
		      functionDesignator
		      parameterList
		      set
		      elementList
		      elementLst
		      element
		      procedureStatement
		      actualParameter
		      parameterwidth
		      gotoStatement
		      structuredStatement
		      compoundStatement
		      statements
		      conditionalStatement
		      ifStatement
		      caseStatement
		      caseListElement
		      repetetiveStatement
		      whileStatement
		      repeatStatement
		      forStatement
		      forList
		      initialValue
		      finalValue
		      withStatement
		      recordVariableList
		      AND
		      ARRAY
		      BEGIN
		      BOOLEAN
		      CASE
		      CHAR
		      CHR
		      CONST
		      DIV
		      DO
		      DOWNTO
		      ELSE
		      END
		      FILE
		      FOR
		      FUNCTION
		      GOTO
		      IF
		      IN
		      INTEGER
		      LABEL
		      MOD
		      cNIL
		      NOT
		      OF
		      OR
		      PACKED
		      PROCEDURE
		      PROGRAM
		      REAL
		      RECORD
		      REPEAT
		      SET
		      THEN
		      TO
		      TYPE
		      UNTIL
		      VAR
		      WHILE
		      WITH
		      PLUS
		      STAR
		      SLASH
		      ASSIGN
		      COMMA
		      SEMI
		      COLON
		      EQUAL
		      NOT_EQUAL
		      LT
		      LE
		      GE
		      GT
		      LPAREN
		      RPAREN
		      LBRACK
		      LBRACK2
		      RBRACK
		      RBRACK2
		      POINTER
		      AT
		      DOT
		      DOTDOT
		      LCURLY
		      RCURLY
		      UNIT
		      INTERFACE
		      USES
		      STRING
		      IMPLEMENTATION
		      TRUE
		      FALSE
		      WS
		      COMMENT_1
		      COMMENT_2
		      IDENT
		      STRING_LITERAL
		      NUM_INT
		      NUM_REAL
		      EXPONENT
		      FILE_CUT
		      DIR
		      FILENAME
		      FILEEXT
		      Spacing
		      pSpace
		      EndOfLine
		      EndOfFile
		      ))

(defun traceall ()
  (mapc #'esrap:trace-rule *all*)
  (values))

(defun untraceall ()
  (mapc #'esrap:untrace-rule *all*)
  (values))
