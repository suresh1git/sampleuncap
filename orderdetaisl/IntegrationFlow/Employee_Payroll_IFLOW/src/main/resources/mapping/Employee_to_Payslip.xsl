<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">

    <!-- Calculate Gross Salary -->
    <xsl:variable name="grossSalary" select="sum(root/Employee/salaryComponents/amount)"/>

    <!-- Get Basic for PF calculation -->
    <xsl:variable name="basic" select="root/Employee/salaryComponents[component='Basic']/amount"/>

    <!-- PF = 12% of Basic -->
    <xsl:variable name="pf" select="$basic * 12 div 100"/>

    <!-- Professional Tax -->
    <xsl:variable name="profTax">
      <xsl:choose>
        <xsl:when test="$grossSalary &gt;= 50000">2500</xsl:when>
        <xsl:when test="$grossSalary &gt;= 30000">1500</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- TDS -->
    <xsl:variable name="tds">
      <xsl:choose>
        <xsl:when test="$grossSalary &gt;= 50000">
          <xsl:value-of select="$grossSalary * 10 div 100"/>
        </xsl:when>
        <xsl:when test="$grossSalary &gt;= 30000">
          <xsl:value-of select="$grossSalary * 5 div 100"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- Total Deductions -->
    <xsl:variable name="totalDeductions" select="$pf + $profTax + $tds"/>

    <!-- Net Salary -->
    <xsl:variable name="netSalary" select="$grossSalary - $totalDeductions"/>

    <Payslip>
      <EmployeeId><xsl:value-of select="root/Employee/empId"/></EmployeeId>
      <EmployeeName><xsl:value-of select="root/Employee/empName"/></EmployeeName>
      <Department><xsl:value-of select="root/Employee/department"/></Department>
      <Designation><xsl:value-of select="root/Employee/designation"/></Designation>
      <Earnings>
        <xsl:for-each select="root/Employee/salaryComponents">
          <Earning>
            <ComponentName><xsl:value-of select="component"/></ComponentName>
            <Amount><xsl:value-of select="amount"/></Amount>
          </Earning>
        </xsl:for-each>
      </Earnings>
      <GrossSalary><xsl:value-of select="$grossSalary"/></GrossSalary>
      <Deductions>
        <PF><xsl:value-of select="$pf"/></PF>
        <ProfessionalTax><xsl:value-of select="$profTax"/></ProfessionalTax>
        <TDS><xsl:value-of select="$tds"/></TDS>
        <TotalDeductions><xsl:value-of select="$totalDeductions"/></TotalDeductions>
      </Deductions>
      <NetSalary><xsl:value-of select="$netSalary"/></NetSalary>
    </Payslip>
  </xsl:template>
</xsl:stylesheet>