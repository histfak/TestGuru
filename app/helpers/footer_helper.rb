module FooterHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'My GitHub repo', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
