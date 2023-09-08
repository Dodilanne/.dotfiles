echo "Setting up Rectangle..."

defaults write com.knollsoft.Rectangle specified -dict-add keyCode -float 32 modifierFlags -float 917795
defaults write com.knollsoft.Rectangle specifiedWidth -float 0.65
defaults write com.knollsoft.Rectangle specifiedHeight -float 0.80

defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 10
defaults write com.knollsoft.Rectangle screenEdgeGapBottom -int 10
defaults write com.knollsoft.Rectangle screenEdgeGapLeft -int 10
defaults write com.knollsoft.Rectangle screenEdgeGapRight -int 10

defaults write com.knollsoft.Rectangle snapEdgeMarginTop -int 10
defaults write com.knollsoft.Rectangle snapEdgeMarginBottom -int 10
defaults write com.knollsoft.Rectangle snapEdgeMarginLeft -int 10
defaults write com.knollsoft.Rectangle snapEdgeMarginRight -int 10

echo "Done."
