*Can external shocks affect total factor productivity? Evidence from China's listed exporters

global X "L1_π_op CI SGR QC"
global Y " CI SGR QC "

*Table 1 Descriptive Statistics of Key Variables
outreg2 using "Descriptive Statistics.doc", replace sum(log)


*Table 10. Hausman Test
quietly reghdfe lntfp GPR $X
est sto Ols

quietly reghdfe lntfp GPR $X , a(country)
est sto CountryFE

quietly reghdfe lntfp GPR $X , a(stkcd)
est sto CompanyFE

quietly reghdfe lntfp GPR $X , a(year)
est sto YearFE

quietly reghdfe lntfp GPR $X , a(country stkcd)
est sto CompanyCountryFE

quietly reghdfe lntfp GPR $X , a(country year)
est sto CountryYearFE

quietly reghdfe lntfp GPR $X , a(stkcd year)
est sto CompanyYearFE

quietly reghdfe lntfp GPR $X , a(stkcd country year)
est sto CompanyCountryyearFE

hausman CountryFE Ols, constant sigmamore
hausman CompanyFE Ols, constant sigmamore
hausman YearFE Ols, constant sigmamore

hausman CompanyCountryFE CountryFE, constant sigmamore
hausman CompanyCountryFE CompanyFE, constant sigmamore

hausman CountryYearFE CountryFE, constant sigmamore
hausman CountryYearFE YearFE, constant sigmamore

hausman CompanyYearFE YearFE, constant sigmamore
hausman CompanyYearFE CompanyFE, constant sigmamore

hausman CompanyCountryyearFE CompanyCountryFE, constant sigmamore
hausman CompanyCountryyearFE CountryYearFE, constant sigmamore
hausman CompanyCountryyearFE CompanyYearFE, constant sigmamore

hausman CompanyYearFE CompanyCountryFE, constant sigmamore
hausman CompanyYearFE CountryYearFE, constant sigmamore
hausman CompanyCountryFE CountryYearFE, constant sigmamore

*Table 2. Baseline Regression
reghdfe lntfp GPR $X , a(stkcd country year)
outreg2 using "Baseline Regression.rtf", replace tstat bdec(3) tdec(2) addtext(Company FE, YES,Year FE, YES,Country FE, Yes) ctitle(lnTFP)

reghdfe lntfp GPR $X ,a(country stkcd)
outreg2 using "Baseline Regression.rtf", append tstat bdec(3) tdec(2) addtext(Country FE,YES,Company FE,YES) ctitle(lnTFP)

reghdfe lntfp GPR  $X  if shiftmarket==0, a(stkcd year country)
outreg2 using "Baseline Regression.rtf", append tstat bdec(3) tdec(2) addtext(Company FE,YES,Year FE,YES,Country FE, YES) ctitle(lnTFP)

reghdfe lntfp GPR $X if shiftmarket == 0,a(stkcd country)
outreg2 using "Baseline Regression.rtf", append tstat bdec(3) tdec(2) addtext(Country FE,YES,Company FE,YES) ctitle(lnTFP)

reghdfe lntfp GPR $X if decision ==0 , a(stkcd year country)
outreg2 using "Baseline Regression.rtf", append tstat bdec(3) tdec(2) ctitle(lnTFP) addtext(Company FE,YES,Year FE,YES,Country FE, YES) 

reghdfe lntfp GPR $X if decision ==0 , a(stkcd country)
outreg2 using "Baseline Regression.rtf", append tstat bdec(3) tdec(2) ctitle(lnTFP) addtext(Country FE,YES,Company FE,YES)


*Table 3. Time Trend Test Results
reghdfe D1_lntfp D1_GPR D2_π ,a(stkcd country year)
outreg2 using "Time Trend Test.rtf",replace tstat bdec(3) tdec(2) ctitle(D.lntfp) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe D1_lntfp D1_GPR D2_π ,a(stkcd country)
outreg2 using "Time Trend Test.rtf",append tstat bdec(3) tdec(2) ctitle(D.lntfp) addtext(Country FE,YES,Company FE,YES)

reghdfe D1_lntfp D1_GPR D2_π ,a(stkcd year)
outreg2 using "Time Trend Test.rtf",append tstat bdec(3) tdec(2) ctitle(D.lntfp) addtext(Company FE,YES,Year FE,YES)

reghdfe D1_lntfp D1_GPR D2_π ,a(country year)
outreg2 using "Time Trend Test.rtf",append tstat bdec(3) tdec(2) ctitle(D.lntfp) addtext(Country FE,YES,Year FE,YES)

reghdfe D1_lntfp D1_GPR D2_π
outreg2 using "Time Trend Test.rtf",append tstat bdec(3) tdec(2) ctitle(D.lntfp)


*Table 4: Robustness Tests of Different Measurement Methods
reghdfe lntfp GPR $X ,a(country stkcd year)
outreg2 using "Different Measurement Methods.rtf",replace tstat bdec(3) tdec(2) ctitle(LP Method) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp_ols GPR $X ,a(country stkcd year)
outreg2 using "Different Measurement Methods.rtf",append tstat bdec(3) tdec(2) ctitle(OLS Method) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp_fe GPR $X ,a(country stkcd year)
outreg2 using "Different Measurement Methods.rtf",append tstat bdec(3) tdec(2) ctitle(FE Method) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp_op GPR $X ,a(country stkcd year)

outreg2 using "Different Measurement Methods.rtf",append tstat bdec(3) tdec(2) ctitle(OP Method) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp_gmm GPR $X ,a(stkcd country year)

outreg2 using "Different Measurement Methods.rtf",append tstat bdec(3) tdec(2) ctitle(GMM Method) addtext(Country FE,YES,Company FE,YES,Year FE,YES)


*Table 5: Dynamic Lag Robustness Test Results
reghdfe lntfp GPR $X ,a(country stkcd year)
outreg2 using "Dynamic Lag Robustness Test.rtf",replace tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp GPR L1_GPR L2_GPR $X ,a(country stkcd year)
outreg2 using "Dynamic Lag Robustness Test.rtf",append tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp GPR L1_GPR L2_GPR L3_GPR L4_GPR $X ,a(country stkcd year)
outreg2 using "Dynamic Lag Robustness Test.rtf",append tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp GPR L1_GPR L2_GPR L3_GPR L4_GPR L5_GPR $X ,a(country stkcd year)
outreg2 using "Dynamic Lag Robustness Test.rtf",append tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Country FE,YES,Company FE,YES,Year FE,YES)

reghdfe lntfp GPR L1_GPR L2_GPR L3_GPR L4_GPR L5_GPR L6_GPR  $X ,a(country stkcd year)
outreg2 using "Dynamic Lag Robustness Test.rtf",append tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Country FE,YES,Company FE,YES,Year FE,YES)


*Table 6: Mechanism Test Results

reghdfe lntfp exit GPR $Y , a(stkcd country year)
outreg2 using "Mechanism Test.rtf",replace tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Company FE,YES,Year FE, YES,Country FE,YES)

reghdfe exit GPR $Y if decision !=3,a(stkcd country year)
outreg2 using "Mechanism Test.rtf",append tstat bdec(3) tdec(2) ctitle(e) addtext(Company FE,YES,Year FE, YES,Country FE,YES)

reghdfe lntfp lnRD offmarket GPR $Y ,a(country stkcd)
outreg2 using "Mechanism Test.rtf",append tstat bdec(3) tdec(2) ctitle(lntfp) addtext(Company FE,YES,Year FE, YES,Country FE,YES)

reghdfe offmarket GPR  $Y ,a(country stkcd year)
outreg2 using "Mechanism Test.rtf",append tstat bdec(3) tdec(2) ctitle(offmarket) addtext(Company FE,YES,Year FE, YES,Country FE,YES)

reghdfe lnRD GPR offmarket  $Y ,a(country stkcd year)
outreg2 using "Mechanism Test.rtf",append tstat bdec(3) tdec(2) ctitle(offmarket) addtext(Company FE,YES,Year FE, YES,Country FE,YES)




*Table 7: Heterogeneity Analysis Results
qui reghdfe lntfp GPR $X ,a(country stkcd year)
scalar a = e(rss)

qui reghdfe lntfp GPR $X if type==1,a(country stkcd year)
scalar b =e(rss)
scalar n1=e(N)
outreg2 using "Heterogeneity Analysis.rtf",replace tstat bdec(3) tdec(2) ctitle(General Trade) addtext(Company FE,YES,Year FE, YES,Country FE,YES)

qui reghdfe lntfp GPR $X if type==2 | type==3,a(country stkcd year)
scalar c=e(rss)
scalar n2=e(N)
outreg2 using "Heterogeneity Analysis.rtf",append tstat bdec(3) tdec(2) ctitle(Processing Trade) addtext(Company FE,YES,Year FE, YES,Country FE,YES)



reghdfe lntfp GPR $X if stateowned==0,a(country stkcd year) 
outreg2 using "Heterogeneity Analysis.rtf",append tstat bdec(3) tdec(2) ctitle(not) addtext(Company FE,YES,Year FE, YES,Country FE,YES)
reghdfe lntfp GPR $X if stateowned==1,a(country stkcd year) 
outreg2 using "Heterogeneity Analysis.rtf",append tstat bdec(3) tdec(2) ctitle(yes) addtext(Company FE,YES,Year FE, YES,Country FE,YES)



*Table 8:Further Discussion
reghdfe lntfp lnRD GPR $Y , a(stkcd year country)
outreg2 using "外部冲击与技术进步（Further Discussion）.rtf", replace tstat bdec(3) tdec(2) addtext(Company FE, YES,Year FE, YES,Country FE, YES) ctitle(lnTFP)

reghdfe lnRD GPR GPR $Y , a(stkcd year country)
outreg2 using "外部冲击与技术进步（Further Discussion）.rtf", append tstat bdec(3) tdec(2) addtext(Company FE, YES,Year FE, YES,Country FE, YES) ctitle(lnTFP)

reghdfe lnRD GPR L1_GPR L2_GPR L3_GPR L4_GPR L5_GPR L6_GPR L7_GPR $Y , a(stkcd year country)
outreg2 using "外部冲击与技术进步（Further Discussion）.rtf", append tstat bdec(3) tdec(2) addtext(Company FE, YES,Year FE, YES,Country FE, YES) ctitle(lnTFP)


