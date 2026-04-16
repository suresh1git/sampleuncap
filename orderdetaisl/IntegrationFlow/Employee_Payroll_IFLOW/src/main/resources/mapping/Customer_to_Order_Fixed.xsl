<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <Order>
      <CustomerId><xsl:value-of select="root/Customer/id"/></CustomerId>
      <FullName><xsl:value-of select="root/Customer/name"/></FullName>
      <TotalAmount><xsl:value-of select="root/Customer/amount"/></TotalAmount>
    </Order>
  </xsl:template>
</xsl:stylesheet>