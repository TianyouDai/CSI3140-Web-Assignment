<?xml version="1.0" ?>
<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
	<xsl:template match = "/">	
		<html>
			<head>
				<meta charset="utf-8">
				<title>Question 7</title>
			</head>

			<body>
				<xsl:for-each select="/product/snack">
					<table border = "1">
						<caption>Nutrition Facts for <xsl:value-of select = "@name"/></caption>

						<tr>
							<th>Serving Size</th>
							<td><xsl:value-of select = "size"/></td>
						</tr>

						<tr>
							<th>Calories</th>
							<td><xsl:value-of select = "calories"/></td>
						</tr>

						<tr>
							<th>Fat Calories</th>
							<td><xsl:value-of select = "fatcalories"/></td>
						</tr>

						<tr>
							<th>Fat</th>
							<td><xsl:value-of select = "fat"/></td>
						</tr>

						<tr>
							<th>Saturated Fat</th>
							<td><xsl:value-of select = "saturatedfat"/></td>
						</tr>

						<tr>
							<th>Cholesterol</th>
							<td><xsl:value-of select = "cholesterol"/></td>
						</tr>

						<tr>
							<th>Sodium</th>
							<td><xsl:value-of select = "sodium"/></td>
						</tr>

						<tr>
							<th>Carbohydrates</th>
							<td><xsl:value-of select = "carbohydrates"/></td>
						</tr>

						<tr>
							<th>Fibers</th>
							<td><xsl:value-of select = "fibers"/></td>
						</tr>

						<tr>
							<th>Sugar</th>
							<td><xsl:value-of select = "sugar"/></td>
						</tr>

						<tr>
							<th>Proteins</th>
							<td><xsl:value-of select = "proteins"/></td>
						</tr>
					</table>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>