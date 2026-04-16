<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <SalesOrder>
      <OrderNumber><xsl:value-of select="root/PurchaseOrder/poNumber"/></OrderNumber>
      <OrderDate><xsl:value-of select="root/PurchaseOrder/poDate"/></OrderDate>
      <CustomerName><xsl:value-of select="root/PurchaseOrder/buyer"/></CustomerName>
      <LineItems>
        <xsl:for-each select="root/PurchaseOrder/items">
          <LineItem>
            <LineNumber><xsl:value-of select="itemId"/></LineNumber>
            <Material><xsl:value-of select="productName"/></Material>
            <Qty><xsl:value-of select="quantity"/></Qty>
            <Price><xsl:value-of select="unitPrice"/></Price>
          </LineItem>
        </xsl:for-each>
      </LineItems>
    </SalesOrder>
  </xsl:template>
</xsl:stylesheet>