class Assemble < Formula
  include Language::Python::Virtualenv

  desc "Terminal and web group chat with multiple AI models (OpenAI & Anthropic)"
  homepage "https://github.com/imaresss/AI_Group_chat"
  url "https://github.com/imaresss/AI_Group_chat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license :cannot_represent

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system libexec/"bin/python", "-c", "import groupchat; import groupchat.web_app"
    assert_match "Usage", shell_output("#{bin}/assemble not-a-command 2>&1", 1)
  end

  def caveats
    <<~EOS
      Export your API keys before running:
        export OPENAI_API_KEY="sk-..."
        export ANTHROPIC_API_KEY="sk-ant-..."

      Optionally create ~/.groupchat/config.json to customise models.
      See: https://github.com/imaresss/AI_Group_chat/blob/main/groupchat_config.example.json

      To start the web chat:
        assemble

      To stop it:
        assemble stop
    EOS
  end
end
