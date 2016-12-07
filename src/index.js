(() => {
  if (location.host !== 'github.com') {
    alert('only available in github.com');
    return;
  }
  
  let [, user, repos] = location.href.match(/github.com\/([^\/]+)\/([^\/]+)/);
  location.href = `https://${user}.github.io/${repos}`;
})();
