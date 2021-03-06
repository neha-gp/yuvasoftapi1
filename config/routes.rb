Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do
      resources :categories
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :clientstetimonials
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :blogs
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :careers
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :company_events
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :teams
    end
  end
end
