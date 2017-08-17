angular.module('loomioApp').directive 'lmoTextarea', (EmojiService, AttachmentService, MentionService) ->
  scope: {model: '=', field: '@', label: '=?', placeholder: '=?', helptext: '=?'}
  restrict: 'E'
  templateUrl: 'generated/components/lmo_textarea/lmo_textarea.html'
  replace: true
  controller: ($scope, $element) ->
    EmojiService.listen $scope, $scope.model, $scope.field, $element
    MentionService.applyMentions $scope, $scope.model
    AttachmentService.listenForPaste $scope