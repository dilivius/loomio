angular.module('loomioApp').controller 'PollPageController', ($scope, $rootScope, $routeParams, MessageChannelService, Records, $location, ModalService, PollService, PollCommonOutcomeModal, PollCommonEditVoteModal, PollCommonShareModal, Session) ->
  @init = (poll) =>
    if poll and !@poll?
      @poll = poll

      $rootScope.$broadcast 'currentComponent',
        group: @poll.group()
        title: poll.title
        page: 'pollPage'
        skipScroll: true

      MessageChannelService.subscribeToPoll(@poll)

      if $location.search().share
        ModalService.open PollCommonShareModal, poll: => @poll

      if $location.search().set_outcome
        ModalService.open PollCommonOutcomeModal, outcome: => Records.outcomes.build(pollId: @poll.id)

      if $location.search().change_vote
        ModalService.open PollCommonEditVoteModal, stance: => PollService.lastStanceBy(Session.user(), @poll)

  Records.polls.findOrFetchById($routeParams.key).then @init, (error) ->
    $rootScope.$broadcast('pageError', error)

  return
