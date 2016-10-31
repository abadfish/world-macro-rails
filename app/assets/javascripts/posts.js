newsRefresh = function() {
  $('#news-refresh').on('change', function() {
      debugger

      window.location.href =  '/news_source?utf8=✓&news=' + $('#news-refresh form #news').val();


  });
};

$(document).ready(function() {
  newsRefresh();
});
