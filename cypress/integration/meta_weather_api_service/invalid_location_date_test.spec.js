describe('Testing of the Meta Weather API (Invalid Location):', () => {
 var response;
 var base_url = 'https://www.metaweather.com/api/location/';

 //date-related variables used throughout the test
 var date = new Date();
 var today = date.getDay();

 var year = date.getFullYear();
 var month = date.getMonth();
 var invalid_location_url = base_url + '00000' + '/' + year.toString() + '/' + month.toString() + '/' + today + '/';

 it('Invalid Location => Validate the header:', () => {
  response = cy.request({
   url: invalid_location_url,
   failOnStatusCode: false
  })
  response.its('headers')
   .its('content-type')
   .should('include', 'application/json')
 })

 it('Invalid Location => Validate the status:', () => {
  response = cy.request({
   url: invalid_location_url,
   failOnStatusCode: false
  })
  response.its('status')
   .should('equal', 404);
 })

 it('Invalid Location => Validate that the body is not empty and includes the Not Found message:', () => {
  response = cy.request({
   url: invalid_location_url,
   failOnStatusCode: false
  })
  response.its('body')
   .should('not.be.empty')
   .and('include', {detail: 'Not found.' });
 })

})
