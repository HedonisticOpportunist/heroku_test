describe('Testing of the Meta Weather API (London):', () => {
 var response;
 var base_url = 'https://www.metaweather.com/api/location/';

 //variables consumed throughout the test
 var date = new Date();
 var today = date.getDay();
 var year = date.getFullYear();
 var month = date.getMonth();

 var london = '44418';
 var london_url = base_url + london + '/' + year.toString() + '/' + month.toString() + '/' + today + '/';

 it('London + Today => Validate the header:', () => {
  response = cy.request(london_url)
  response.its('headers')
   .its('content-type')
   .should('include', 'application/json')
 })

 it('London + Today => Validate the status:', () => {
  response = cy.request(london_url)
  response.its('status')
   .should('equal', 200);
 })

 it('London + Today => Validate that the body is not empty:', () => {
  response = cy.request(london_url)
  response.its('body')
   .should('not.be.empty');
 })

 it('London + Today => Validate that the body length is greater than 2:', () => {
  response = cy.request(london_url)
  response.its('body.length')
   .should('be.gt', 2)
 })

})
