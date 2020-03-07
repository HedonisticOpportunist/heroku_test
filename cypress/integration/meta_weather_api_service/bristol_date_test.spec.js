describe('Testing of the Meta Weather API (Bristol):', () => {
 var response;
 var base_url = 'https://www.metaweather.com/api/location/';

 //date-related variables used throughout the test
 var date = new Date();
 var past_year = date.getFullYear() - 2;
 var other_month = date.getMonth() + 1;
 var other_day = date.getDate() + 3;

 var bristol = '13963';
 var bristol_url = base_url + bristol + '/' + past_year.toString() + '/' + other_month.toString() + '/' + other_day + '/';

 it('Bristol 2018 => Validate the header:', () => {
  response = cy.request(bristol_url)
  response.its('headers')
   .its('content-type')
   .should('include', 'application/json')

 })

 it('Bristol 2018 => Validate the status:', () => {
  response = cy.request(bristol_url)
  response.its('status')
   .should('equal', 200);
 })

 it('Bristol 2018 => Validate that the body is not empty:', () => {
  response = cy.request(bristol_url)
  response.its('body')
   .should('not.be.empty');
 })

 it('Bristol 2018 => Validate that the body length is greater than 2:', () => {
  response = cy.request(bristol_url)
  response.its('body.length')
   .should('be.gt', 2)
 })

})
