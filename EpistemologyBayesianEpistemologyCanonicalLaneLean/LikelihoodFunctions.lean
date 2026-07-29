import EpistemologyBayesianEpistemologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure LikelihoodFunction (θ : Type) (data : Type) where
  l : θ → data → ℝ
  nonnegative : ∀ (x : θ) (y : data), l x y ≥ 0
  normalizable : Prop
  nonnegativeProof : nonnegative

structure LikelihoodEvidence (θ : Type) (data : Type) (L : LikelihoodFunction θ data) where
  nonnegativeClosed : ∀ (x : θ) (y : data), L.l x y ≥ 0
  normalizableClosed : L.normalizable

def LikelihoodClosed (θ : Type) (data : Type) (L : LikelihoodFunction θ data) : Prop :=
  (∀ (x : θ) (y : data), L.l x y ≥ 0) ∧ L.normalizable

theorem likelihood_closed_from_evidence (θ : Type) (data : Type) (L : LikelihoodFunction θ data) (E : LikelihoodEvidence θ data L) : LikelihoodClosed θ data L := by
  exact And.intro E.nonnegativeClosed E.normalizableClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse