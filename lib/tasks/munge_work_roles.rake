namespace :work_roles do
  desc "Iterate through and munge work role text."
  task :munge => :environment do
    STOP_WORDS = [
      'a','cannot','into','our','thus','about','co','is','ours','to','above',
      'could','it','ourselves','together','across','down','its','out','too',
      'after','during','itself','over','toward','afterwards','each','last','own',
      'towards','again','eg','latter','per','under','against','either','latterly',
      'perhaps','until','all','else','least','rather','up','almost','elsewhere',
      'less','same','upon','alone','enough','ltd','seem','us','along','etc',
      'many','seemed','very','already','even','may','seeming','via','also','ever',
      'me','seems','was','although','every','meanwhile','several','we','always',
      'everyone','might','she','well','among','everything','more','should','were',
      'amongst','everywhere','moreover','since','what','an','except','most','so',
      'whatever','and','few','mostly','some','when','another','first','much',
      'somehow','whence','any','for','must','someone','whenever','anyhow',
      'former','my','something','where','anyone','formerly','myself','sometime',
      'whereafter','anything','from','namely','sometimes','whereas','anywhere',
      'further','neither','somewhere','whereby','are','had','never','still',
      'wherein','around','has','nevertheless','such','whereupon','as','have',
      'next','than','wherever','at','he','no','that','whether','be','hence',
      'nobody','the','whither','became','her','none','their','which','because',
      'here','noone','them','while','become','hereafter','nor','themselves','who',
      'becomes','hereby','not','then','whoever','becoming','herein','nothing',
      'thence','whole','been','hereupon','now','there','whom','before','hers',
      'nowhere','thereafter','whose','beforehand','herself','of','thereby','why',
      'behind','him','off','therefore','will','being','himself','often','therein',
      'with','below','his','on','thereupon','within','beside','how','once',
      'these','without','besides','however','one','they','would','between','i',
      'only','this','yet','beyond','ie','onto','those','you','both','if','or',
      'though','your','but','in','other','through','yours','by','inc','others',
      'throughout','yourself','can','indeed','otherwise','thru','yourselves',
      'puk', 'pukpuk', 'lvl', 'iii', 'ii', 'iv', 'gs', 'nasa'
      ] + ("a".."z").to_a

    def naive_munge(content)
      munge = content.downcase
      munge = munge.gsub(/[\:\;\=\_\`\~\.\,\"\'\!\@\#\$\%\^\&\*\(\)\{\}\[\]\\\/\<\>\?\-\•]/, ' ')
      munge = munge.gsub(/[0-9]/, ' ')
      munge_array = munge.split(' ').sort

      naive_munge = []
      munge_array.each do |naive_word|
        unless STOP_WORDS.member?(naive_word)
          naive_munge.push(naive_word)
        end
      end

      # Naive bootstrapping to try and normalize document length.
      # return naive_munge.sample(1000).join(' ')

      return naive_munge.join(' ')
    end

    def nice_munge(nice_work_role)
      
      # All the basic descriptions.
      munge = [nice_work_role.nice_area.nice_category.description,
              nice_work_role.nice_area.description,
              nice_work_role.description]

      # All the knowledge.
      nice_work_role.nice_knowledge_mappings.each do |mapping|
        munge.push(mapping.nice_knowledge.description)
      end

      # All the skills.
      nice_work_role.nice_skill_mappings.each do |mapping|
        munge.push(mapping.nice_skill.description)
      end

      # All the abilities.
      nice_work_role.nice_ability_mappings.each do |mapping|
        munge.push(mapping.nice_ability.description)
      end

      # All the tasks.
      nice_work_role.nice_task_mappings.each do |mapping|
        munge.push(mapping.nice_task.description)
      end

      return naive_munge(munge.join(' '))
    end

    # Munge all the NICE work roles.
    NiceWorkRole.all.each do |nice_work_role|
      nice_work_role.munge = nice_munge(nice_work_role)
      nice_work_role.save
    end
  end
end
