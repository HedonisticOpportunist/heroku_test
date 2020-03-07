describe('Testing of the Meta Weather API (Nottingham):', () => {

 var response;
 var base_url = 'https://www.metaweather.com/api/location/';

 //date-related variables used throughout the test
 var date = new Date();
 var tomorrow = date.getDay() + 1;
 var year = date.getFullYear();
 var month = date.getMonth();

 var nottingham = '30720';
 var nottingham_url = base_url + nottingham + '/' + year.toString() + '/' + month.toString() + '/' + tomorrow + '/';

 it('Nottingham + Tomorow => Validate the header:', () => {
  response = cy.request(nottingham_url)
  response.its('headers')
   .its('content-type')
   .should('include', 'application/json')

 })

 it('Nottingham + Tomorow => Validate the status:', () => {
  response = cy.request(nottingham_url)
  response.its('status')
   .should('equal', 200);
 })

 it('Nottingham + Tomorow => Validate that the body is not empty:', () => {
  response = cy.request(nottingham_url)
  response.its('body')
   .should('not.be.empty');
 })

 it('Nottingham + Tomorow => Validate that the response length is greater than 2:', () => {
  response = cy.request(nottingham_url)
  response.its('body.length')
   .should('be.gt', 2)
 })

})
