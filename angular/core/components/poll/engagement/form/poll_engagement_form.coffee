angular.module('loomioApp').factory 'PollEngagementForm', ->
  templateUrl: 'generated/components/poll/engagement/form/poll_engagement_form.html'
  controller: ($scope, poll, FormService, KeyEventService, TranslationService) ->
    $scope.poll = poll.clone()
    $scope.poll.makeAnnouncement = $scope.poll.isNew()

    actionName = if $scope.poll.isNew() then 'created' else 'updated'

    $scope.submit = FormService.submit $scope, $scope.poll,
      flashSuccess: "poll_engagement_form.messages.#{actionName}"
      draftFields: ['title', 'details', 'action']

    TranslationService.eagerTranslate $scope,
      titlePlaceholder:   'poll_engagement_form.title_placeholder'
      detailsPlaceholder: 'poll_engagement_form.details_placeholder'
      actionPlaceholder:  'poll_engagement_form.action_placeholder'

    KeyEventService.submitOnEnter($scope)
