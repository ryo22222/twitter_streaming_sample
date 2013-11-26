TwitterStreamingSample::Application.routes.draw do
  resource :streaming
  root to: "streamings#show"
end
