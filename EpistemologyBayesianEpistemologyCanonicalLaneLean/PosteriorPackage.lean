import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.LikelihoodPackage

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PosteriorPackage {P : PriorPackage} {L : LikelihoodPackage P} where
  posteriorDistribution : Type u
  bayesUpdateCorrect : Prop
  asymptotics : Prop
  consistency : Prop

structure PosteriorEvidence {P : PriorPackage} {L : LikelihoodPackage P} (Post : PosteriorPackage P L) where
  bayesUpdateCorrectClosed : Post.bayesUpdateCorrect
  asymptoticsClosed : Post.asymptotics
  consistencyClosed : Post.consistency

def PosteriorClosed {P : PriorPackage} {L : LikelihoodPackage P} (Post : PosteriorPackage P L) : Prop :=
  Post.bayesUpdateCorrect ∧ Post.asymptotics ∧ Post.consistency

theorem posterior_closed_from_evidence {P : PriorPackage} {L : LikelihoodPackage P} (Post : PosteriorPackage P L) (E : PosteriorEvidence Post) : PosteriorClosed Post :=
  And.intro E.bayesUpdateCorrectClosed (And.intro E.asymptoticsClosed E.consistencyClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse