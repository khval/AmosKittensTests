
on error goto err

	open in 1,"ram:not found"
	goto no_error

err:
	print "can't open file"
	end

no_error:
	print "no error"
	end

	