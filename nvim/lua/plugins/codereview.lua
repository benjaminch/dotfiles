return {
  {
    "afewyards/codereview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "CodeReview", "CodeReviewAI", "CodeReviewStart", "CodeReviewSubmit", "CodeReviewApprove", "CodeReviewOpen" },
    opts = {
      -- Token resolution: env vars GITHUB_TOKEN / GITLAB_TOKEN are checked first automatically.
      -- No tokens set here; set them via environment variables on the host machine.

      -- Platform and project are auto-detected from git remote.
      -- Picker is auto-detected (telescope, fzf, or snacks).
    },
  },
}
