abstract class NewsStates {}

class NewInitialStates extends NewsStates {}

class NewBottomNavBarStates extends NewsStates {}

class NewGetBusinessLoadingState extends NewsStates{}

class NewGetBusinessSuccessState extends NewsStates{}

class NewGetBusinessErrorState extends NewsStates{
  final String error;
  NewGetBusinessErrorState(this.error);
}

class NewGetSciencesSuccessState extends NewsStates{}

class NewGetSciencesErrorState extends NewsStates{
  final String error;

  NewGetSciencesErrorState(this.error);

}

class NewGetSciencesLoadingState extends NewsStates{}

class NewGetSportLoadingState extends NewsStates{}

class NewGetSportSuccessState extends NewsStates{}

class NewGetSportErrorState extends NewsStates{
  final String error;
  NewGetSportErrorState(this.error);



}


class NewGetSearchLoadingState extends NewsStates{}

class NewGetSearchSuccessState extends NewsStates{}

class NewGetSearchErrorState extends NewsStates{
  final String error;
  NewGetSearchErrorState(this.error);



}

