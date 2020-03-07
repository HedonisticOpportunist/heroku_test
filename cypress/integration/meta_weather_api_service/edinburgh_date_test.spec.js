describe('Testing of the Meta Weather Weather API (Edinburgh):', () => {
 var response;
 var base_url = 'https://www.metaweather.com/api/location/';

 //variables used throughout the test
 var date = new Date();
 var yesterday = date.getDay() - 1;

 var year = date.getFullYear();
 var month = date.getMonth();

 var edinburgh = '19344';
 var edinburgh_url = base_url + edinburgh + '/' + year.toString() + '/' + month.toString() + '/' + yesterday + '/';

 it('Edinburgh + Yesterday => Validate the header:', () => {
  response = cy.request(edinburgh_url)
  response.its('headers')
   .its('content-type')
   .should('include', 'application/json')

 })

 it('Edinburgh + Yesterday => Validate the status:', () => {
  response = cy.request(edinburgh_url)
  response.its('status')
   .should('equal', 200);
 })

 it('Edinburgh + Yesterday => Validate that the body is not empty:', () => {
  response = cy.request(edinburgh_url)
  response.its('body')
   .should('not.be.empty');
 })

 it('Edinburgh + Yesterday => Validate that the body length is greater than 2:', () => {
  response = cy.request(edinburgh_url)
  response.its('body.length')
   .should('be.gt', 2)
 })

})
