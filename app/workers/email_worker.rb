class EmailWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(material_id)

      material = Material.find(material_id)

      contacts = material.campaign.contacts
      contacts.each do |contact|
        Emailblast.email1(material, contact).deliver
        binding.pry
      end

    end
end
